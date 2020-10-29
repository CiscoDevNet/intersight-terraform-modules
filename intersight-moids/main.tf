# Intersight Provider Information 
terraform {
  required_providers {
    intersight = {
      source  = "ciscodevnet/intersight"
      version = ">= 0.1.0"
    }
  }
}

data "intersight_compute_physical_summary" "server_moid" {
  name  = var.server_names[count.index]
  count = length(var.server_names)
}

output "server_moids" {
  value = data.intersight_compute_physical_summary.server_moid
}

data "intersight_organization_organization" "organization_moid" {
  name = var.organization_name
}

output "organization_moid" {
  value = data.intersight_organization_organization.organization_moid.moid
}