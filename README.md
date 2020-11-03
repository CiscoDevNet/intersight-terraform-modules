# intersight-terraform-modules

The Cisco Intersight Terraform provider is available in the Terraform Registry at https://registry.terraform.io/providers/CiscoDevNet/intersight/latest.  This repository contains example modules that use the provider.

## Installation and Usage

Use of the Intersight Terraform provider requires the following provider code which will install the provider from the registry:

```
terraform {
  required_providers {
    intersight = {
      source  = "ciscodevnet/intersight"
      version = ">= 0.1.0"
    }
  }
}
```

The intersight-sds (Software Defined Storage) directory in this repository has example code to define Server Policies and Profiles used for a SDS deployment.  Below are instructions on cloning this repository and using the example SDS module:

### Clone this repository and initialize the provider

The following commands can be used to configure your Terraform environment to use the provider:

```
git clone https://github.com/CiscoDevNet/intersight-terraform-modules.git
cd intersight-terraform-modules/intersight-sds
terraform init
```

Terraform should report "Terraform has been successfully initialized!" following the "terraform init" command.

### Configure Intersight API Access and Customize Plans

The intersight-sds/variables.tf file has example API key information that will need to be configured for your Intersight account.  You can create a terraform.tfvars file with settings for your environment of edit variables.tf with your key information.  Server and Intersight Organization information should also be provided based on your Interisght account.

The main.tf file will configure Server Policies for the SDS solution and configure Server Profiles to deploy the solution.  The following commands can be run from the intersight-sds directory to apply the configuraiton:

```
terraform validate
terraform apply
```

"terraform destroy" can be used to remove the configuration if needed.

## Community:

* We are on Slack (https://ciscoucs.slack.com/) - Slack requires registration, but the Cisco Intersight team is open invitation to
  anyone.  Click [here](https://ucspython.herokuapp.com) to register.
