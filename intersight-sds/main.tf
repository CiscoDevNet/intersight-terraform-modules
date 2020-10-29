# Intersight Provider Information 
terraform {
  required_providers {
    intersight = {
      source  = "ciscodevnet/intersight"
      version = ">= 0.1.0"
    }
  }
}

provider "intersight" {
  apikey        = var.api_key_id
  secretkeyfile = var.api_private_key
  endpoint      = var.api_endpoint
}

module "intersight-moids" {
  source            = "../intersight-moids"
  server_names      = var.server_names
  organization_name = var.organization_name
}

resource "intersight_server_profile" "storage-node1" {
  name = "SP-${var.server_names[count.index]}"
  organization {
    object_type = "organization.Organization"
    moid        = module.intersight-moids.organization_moid
  }

  assigned_server {
    moid        = module.intersight-moids.server_moids[count.index].moid
    object_type = "compute.RackUnit"
  }
  action = var.server_profile_action
  count  = length(var.server_names)
}

resource "intersight_adapter_config_policy" "sds-adapter-config-policy" {
  name        = "sds-adapter-config-policy"
  description = "Adapter Configuration Policy for SDS"
  organization {
    object_type = "organization.Organization"
    moid        = module.intersight-moids.organization_moid
  }
  settings {
    slot_id = "MLOM"
    eth_settings {
      lldp_enabled = true
    }
    fc_settings {
      fip_enabled = true
    }
  }

  dynamic "profiles" {
    for_each = intersight_server_profile.storage-node1
    content {
      moid = profiles.value["moid"]
      object_type = "server.Profile"
    }
  }



}