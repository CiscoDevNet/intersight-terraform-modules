# Intersight Provider Information 
terraform {
  required_providers {
    intersight = {
      source  = "ciscodevnet/intersight"
      version = ">= 1.0.0"
    }
  }
}

provider "intersight" {
  apikey    = var.api_key_id
  secretkey = var.api_private_key
  endpoint  = var.api_endpoint
}

# Organization and other required Managed Object IDs (moids)
module "intersight-moids" {
  source            = "../intersight-moids"
  organization_name = var.organization_name
}

# Server moids
data "intersight_compute_physical_summary" "server_moid" {
  name  = var.server_list[count.index].name
  count = length(var.server_list)
}

# Server profiles
resource "intersight_server_profile" "node1" {
  name        = "SP-${var.server_list[count.index].name}"
  description = "Updated Profile for server name ${var.server_list[count.index].name}"
  tags {
    key   = "Site"
    value = "SJC02"
  }
  organization {
    object_type = "organization.Organization"
    moid        = module.intersight-moids.organization_moid
  }
  target_platform = var.server_list[count.index].target_platform
  assigned_server {
    moid        = data.intersight_compute_physical_summary.server_moid[count.index].moid
    object_type = var.server_list[count.index].object_type
  }
  action = var.server_profile_action
  count  = length(var.server_list)
}
