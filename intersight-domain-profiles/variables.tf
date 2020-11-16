# API key info
variable "api_private_key" {}

variable "api_key_id" {}

variable "api_endpoint" {
  default = "https://www.intersight.com"
}

# Switch and Organization names
variable "domain_profile_name" {}

variable "switch_list" {
  type = list
}

variable "organization_name" {
  default = "default"
}

variable "domain_profile_action" {
  default = "No-op"
}