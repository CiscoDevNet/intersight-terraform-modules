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
  organization_name = var.organization_name
}

resource "intersight_fabric_switch_cluster_profile" "domain-profile" {
  name = "DP-${var.domain_profile_name}"
  organization {
    object_type = "organization.Organization"
    moid        = module.intersight-moids.organization_moid
  }
}