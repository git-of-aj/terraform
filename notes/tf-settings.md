```tf
terraform {
  # ... => Only constants allowed here no variables no functions
}
```
- https://developer.hashicorp.com/terraform/language/v1.1.x/settings
## versions
https://developer.hashicorp.com/terraform/tutorials/configuration-language/versions#terraform-version-constraints
- As a best practice, consider using ` ~> ` style version constraints to pin your major and minor Terraform version.
```
----------------------------
main.tf:
terraform {
  required_version = "~>1.5.7"
}
--------------------------------------------

> Terraform version
 terraform version
Terraform v1.3.7
on windows_amd64

Your version of Terraform is out of date! The latest version
is 1.5.7. You can update by downloading from https://www.terraform.io/downloads.html

> terraform init
> 
│ Error: Unsupported Terraform Core version
│
│   on main.tf line 2, in terraform:
│    2:   required_version = "~>1.5.7"
│
│ This configuration does not support Terraform version 1.3.7. To proceed, either choose another supported Terraform
│ version or update this version constraint. Version constraints are normally set for good reason, so updating the
│ constraint may lead to other errors or unexpected behavior.

********SOLUTION:********
Download and update Manually and normally ...
tf init -upgrade => Doesn't works
```
