# API key info
variable "api_private_key" {}

variable "api_key_id" {}

variable "api_endpoint" {
  default = "https://www.intersight.com"
}

# Server and Organization names
variable "server_list" {
  type = list
}

variable "organization_name" {
  default = "default"
}

variable "server_profile_action" {
  default = "No-op"
}

# LAN variables
variable "management_vlan" {}

variable "cluster_vlan" {}
