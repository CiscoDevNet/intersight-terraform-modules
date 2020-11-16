# 
# Example .tfvars file
# Can be copied to terraform.tfvars and edited so that Terraform will automatically use variables from this file.
#
api_private_key = "/Users/dsoper/Downloads/TME-Demodsoper-devSecretKey.txt"
api_key_id      = "596cc79e5d91b400010d15ad/5db71f977564612d30cc3860/5db87ad67564612d301f743d"

# Server names and platform
server_list = [
  {
    name            = "C220M5-WZP23230LJ6",
    object_type     = "compute.RackUnit",
    target_platform = "Standalone"
  },
  {
    name            = "C220M5-WZP23230LJC"
    object_type     = "compute.RackUnit",
    target_platform = "Standalone"
  }
]

management_vlan = 224

client_vlan = 224

cluster_vlan = 224

replication_vlan = 224
