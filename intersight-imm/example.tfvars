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
    vmedia_policy   = "tf-kubam-248-19"
    boot_iso        = "redhat7.5-boot.iso"
    boot_img        = "imm-rhel-172-22-248-19.img"
  },
  {
    name            = "SJC07-R14-FI-1-1-2",
    object_type     = "compute.Blade",
    target_platform = "FIAttached",
    moid            = "5fa5b86f6176752d37b730fd"
    vmedia_policy   = "tf-kubam-248-22"
    boot_iso        = "redhat7.5-boot.iso"
    boot_img        = "imm-rhel-172-22-248-22.img"
  },
  {
    name            = "SJC07-R14-FI-1-1-3",
    object_type     = "compute.Blade",
    target_platform = "FIAttached",
    moid            = "5fa5b8706176752d37b73151"
    vmedia_policy   = "tf-kubam-248-23"
    boot_iso        = "redhat7.5-boot.iso"
    boot_img        = "imm-rhel-172-22-248-23.img"
  }
]

imc_access_vlan = 248

ip_pool = "SJC07-R14-15-IP"

imc_access_policy = "tf-SJC07-R14-15-access"

local_user_policy = "tf-guest-admin"

cluster_vlan = 248
