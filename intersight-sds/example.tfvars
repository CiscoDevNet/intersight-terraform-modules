# 
# Example .tfvars file
# Can be copied to terraform.tfvars and edited so that Terraform will automatically use variables from this file.
#
api_key_id = "5fdcc5627564612d33b78e10/6021b2b47564612d33df625a/6025d3c37564612d330677ec"
api_private_key = "/Users/prathjan/Downloads/SecretKey.txt"
endpoint = "https://intersight.com"


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
