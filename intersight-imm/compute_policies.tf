# Boot order and other compute policies
resource "intersight_boot_precision_policy" "imm-boot-policy" {
  name                     = "imm-boot-policy"
  description              = "Boot Policy for IMM"
  configured_boot_mode     = "Legacy"
  enforce_uefi_secure_boot = false
  organization {
    object_type = "organization.Organization"
    moid        = module.intersight-moids.organization_moid
  }
  boot_devices {
    enabled     = true
    name        = "disk"
    object_type = "boot.LocalDisk"
    additional_properties = jsonencode({
      Slot = "MRAID"
    })
  }
  boot_devices {
    enabled     = true
    name        = "vmedia"
    object_type = "boot.VirtualMedia"
    additional_properties = jsonencode({
      SubType = "kvm-mapped-dvd"
    })
  }

  dynamic "profiles" {
    for_each = intersight_server_profile.node1
    content {
      moid        = profiles.value["moid"]
      object_type = "server.Profile"
    }
  }
}

/*
resource "intersight_vmedia_policy" "imm-kubam" {
  name    = var.server_list[count.index].vmedia_policy
  enabled = true

  mappings = [{
    additional_properties   = ""
    authentication_protocol = "none"
    class_id                = "vmedia.Mapping"
    device_type             = "cdd"
    host_name               = "172.28.224.72"
    is_password_set         = false
    mount_options           = ""
    mount_protocol          = "http"
    object_type             = "vmedia.Mapping"
    password                = ""
    remote_file             = var.server_list[count.index].boot_iso
    remote_path             = "kubam"
    username                = ""
    volume_name             = "http-cdd"
  }]

  organization {
    object_type = "organization.Organization"
    moid        = module.intersight-moids.organization_moid
  }

  profiles {
    moid        = intersight_server_profile.node1[count.index].id
    object_type = "server.Profile"
  }

  count = length(var.server_list)
}
*/
