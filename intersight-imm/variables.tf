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

# IMC access variables
variable "imc_access_vlan" {}

variable "ip_pool" {}

variable "imc_access_policy" {}

variable "local_user_policy" {}

variable "local_username" {}

variable "local_username_password" {}

# vNIC variables
variable "cluster_vlan" {}
