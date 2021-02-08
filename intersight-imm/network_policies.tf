# LAN Connectivity and other related policies
resource "intersight_fabric_eth_network_control_policy" "imm-eth-network-control-policy" {
  name        = "imm-eth-network-control-policy"
  description = "Fabric Eth Network Control Policy for IMM"
  organization {
    object_type = "organization.Organization"
    moid        = module.intersight-moids.organization_moid
  }

}

resource "intersight_vnic_eth_adapter_policy" "imm-ethernet-adapter-policy" {
  name         = "imm-ethernet-adapter-policy"
  description  = "Ethernet Adapter Policy for IMM"
  rss_settings = true
  organization {
    object_type = "organization.Organization"
    moid        = module.intersight-moids.organization_moid
  }
  vxlan_settings {
    enabled = false
  }

  nvgre_settings {
    enabled = false
  }

  arfs_settings {
    enabled = false
  }
}

resource "intersight_fabric_eth_network_group_policy" "imm-sjc07-248-net-group" {
  name        = "imm-sjc07-248-net-group2"
  description = "Cluster Network for SJC07 248 IMM"
  organization {
    object_type = "organization.Organization"
    moid        = module.intersight-moids.organization_moid
  }
  vlan_settings {
    allowed_vlans = var.cluster_vlan
    native_vlan   = var.cluster_vlan
  }
}

resource "intersight_vnic_eth_qos_policy" "imm-ethernet-qos-policy" {
  name           = "imm-ethernet-qos-policy"
  description    = "Ethernet quality of service for IMM"
  mtu            = 9000
  rate_limit     = 0
  cos            = 0
  trust_host_cos = false
  organization {
    object_type = "organization.Organization"
    moid        = module.intersight-moids.organization_moid
  }
}

resource "intersight_vnic_lan_connectivity_policy" "imm-lan-connectivity-policy" {
  name            = "imm-lan-connectivity-policy"
  description     = "LAN Connectivity Policy for IMM"
  placement_mode  = "auto"
  target_platform = "FIAttached"
  organization {
    object_type = "organization.Organization"
    moid        = module.intersight-moids.organization_moid
  }

  dynamic "profiles" {
    for_each = intersight_server_profile.node1
    content {
      moid        = profiles.value["moid"]
      object_type = "server.Profile"
    }
  }
}

resource "intersight_vnic_eth_if" "eth0" {
  name  = "eth0"
  order = 0
  placement {
    id        = "MLOM"
    pci_link  = 0
    uplink    = 0
    switch_id = "A"
  }
  failover_enabled = true
  mac_pool {
    moid        = "5f35631f6962752d3125234c"
    object_type = "macpool.Pool"
  }
  lan_connectivity_policy {
    moid        = intersight_vnic_lan_connectivity_policy.imm-lan-connectivity-policy.id
    object_type = "vnic.LanConnectivityPolicy"
  }
  fabric_eth_network_group_policy {
    moid = intersight_fabric_eth_network_group_policy.imm-sjc07-248-net-group.id
  }
  fabric_eth_network_control_policy {
    moid = intersight_fabric_eth_network_control_policy.imm-eth-network-control-policy.id
  }
  eth_adapter_policy {
    moid = intersight_vnic_eth_adapter_policy.imm-ethernet-adapter-policy.id
  }
  eth_qos_policy {
    moid = intersight_vnic_eth_qos_policy.imm-ethernet-qos-policy.id
  }
}
