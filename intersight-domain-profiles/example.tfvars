# 
# Example .tfvars file
# Can be copied to terraform.tfvars and edited so that Terraform will automatically use variables from this file.
#
api_private_key = "/Users/dsoper/Downloads/TME-Demodsoper-devSecretKey.txt"
api_key_id      = "596cc79e5d91b400010d15ad/5db71f977564612d30cc3860/5db87ad67564612d301f743d"

# Profile names and switch information
domain_profile_name = "SJC07-R14-FI-1"

switch_list = [
  {
    name = "SCJ07-R14-FI-1-A"
  },
  {
    name = "SCJ07-R14-FI-1-B"
  }
]