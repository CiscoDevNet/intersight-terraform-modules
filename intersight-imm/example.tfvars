# 
# Example .tfvars file
# Can be copied to terraform.tfvars and edited so that Terraform will automatically use variables from this file.
#
api_private_key = "/Users/dsoper/Downloads/TME-Demodsoper-devSecretKey.txt"
api_key_id      = "596cc79e5d91b400010d15ad/5db71f977564612d30cc3860/5db87ad67564612d301f743d"

# Server names and platform
server_list = [
  {
    name            = "SJC07-R14-FI-1-1-1",
    object_type     = "compute.Blade",
    target_platform = "FIAttached",
    moid            = "5fa5b8726176752d37b73331"
  },
  {
    name            = "SJC07-R14-FI-1-1-2",
    object_type     = "compute.Blade",
    target_platform = "FIAttached",
    moid            = "5fa5b86f6176752d37b730fd"
  },
]

management_vlan = 224

cluster_vlan = 224
