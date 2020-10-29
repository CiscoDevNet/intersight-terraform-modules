# API key info
variable "api_private_key" {
  default = "/Users/dsoper/Downloads/DevNetSecretKey.txt"
}

variable "api_key_id" {
  default = "596cc79e5d91b400010d15ad/5db71f977564612d30cc3860/5f0f42d47564612d3363b87b"
}

variable "api_endpoint" {
  default = "https://www.intersight.com"
}

# Server and Organization names
variable "server_names" {
  default = ["C220M5-WZP23230LJ6", "C220M5-WZP23230LJC"]
}

variable "organization_name" {
  default = "DevNet"
}

variable "server_profile_action" {
  default = "No-op"
}