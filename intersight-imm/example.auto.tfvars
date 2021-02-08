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
    vmedia_policy   = "tf-esxi67u3-248-240"
    boot_iso        = "esxi67u3-172-22-248-240.iso"
  },
  {
    name            = "SJC07-R14-FI-1-1-2",
    object_type     = "compute.Blade",
    target_platform = "FIAttached",
    vmedia_policy   = "tf-esxi67u3-248-241"
    boot_iso        = "esxi67u3-172-22-248-241.iso"
  },
  {
    name            = "SJC07-R14-FI-1-1-3",
    object_type     = "compute.Blade",
    target_platform = "FIAttached",
    vmedia_policy   = "tf-esxi67u3-248-242"
    boot_iso        = "esxi67u3-172-22-248-242.iso"
  }
]

imc_access_vlan = 248

ip_pool = "SJC07-R14-15-IP"

imc_access_policy = "tf-SJC07-R14-15-access"

local_user_policy = "tf-guest-admin"

cluster_vlan = 248
