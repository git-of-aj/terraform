- Providers = interact with API
 ```sh
  # just for installing provider you can even right ;
  provider azurerm{}
resource "doc_name" "local name" => doc name + local name = UID for your resource hence unique withiin your system 
  ````
- provider adds a set of resource types and/or data sources that Terraform can manage.
- **without providers, Terraform can't manage any kind of infrastructure.**
- TF Registry  = Home for providers
> DOCS SUGGEST: In production we recommend constraining the acceptable provider versions in the configuration's provider requirements block, to make sure that terraform init does not install newer versions of the provider that are incompatible with the configuration.
1.Provider Requirements documents how to declare providers so Terraform can install them.
2.Provider Configuration documents how to configure settings for providers.
3.Dependency Lock File documents an additional HCL file that can be included with a configuration, which tells Terraform to always use a specific set of provider versions.
 -- use alias for Multiple Provider Configurations => `<PROVIDER NAME>.<ALIAS>`
```sh
# The default provider configuration; resources that begin with `aws_` will use
# it as the default, and it can be referenced as `aws`.
provider "aws" {
  region = "us-east-1"
}

# Additional provider configuration for west coast region; resources can
# reference this as `aws.west`. ==> 
provider "aws" {
  alias  = "west"
  region = "us-west-2"
}
```
## Facts:
- Terraform plan / apply : auto runs tf refresh command
- tf refresh: changes tfstate file like if you change region .... but you also have backup state file 
- Terraform Cloud and Terraform Enterprise install providers as part of every run.
- To save time: plugin_cache_dir : store in cache

> DOCS SAYS- To ensure Terraform always installs the same provider versions for a given configuration, you can use Terraform CLI to create a dependency lock file and commit it to version control along with your configuration.
 - Reinitializing Only Modules - `Tf Get` but many ignore it as `TF init` does all work.
 - **TF working directory contents:**
  1. A hidden `.terraform directory`, which Terraform uses to manage cached provider plugins and modules, record which workspace is currently active, and record the last known backend configuration in case it needs to migrate state on the next run.
  2. State File:

-----------------------------------------------
# TF INIT:
- During init, the configuration is searched for module blocks, and the source code for referenced modules is retrieved from the locations given in their source argument
- `--upgrade` to update to latest versions
- init can be run against an empty directory with the `-from-module=MODULE-SOURCE` option, in which case the given module will be copied into the target directory before any other initialization steps are run.
- [Backend Initialisation](https://developer.hashicorp.com/terraform/cli/commands/init#backend-initialization)
- [TF with Pipelines](https://developer.hashicorp.com/terraform/tutorials/automation/automate-terraform?utm_source=WEBSITE&utm_medium=WEB_IO&utm_offer=ARTICLE_PAGE&utm_content=DOCS)

---------------------------------------------------------------
## Provider Auth Methods:
1. **Env Variables**
```powershell
# TESTED:
# Exporting like $Keys ==> saves variables but TF can't access it and gives error: 
#  terraform plan
╷
│ Error: No valid credential sources found
│ 
│   with provider["registry.terraform.io/hashicorp/aws"],
│   on vpc.tf line 10, in provider "aws":
│   10: provider "aws" {

$env:AWS_ACCESS_KEY_ID = "your_access_key"
$env:AWS_SECRET_ACCESS_KEY = "your_secret_key"
```

## FACT 💡
- after you apply => `Terraform.tfstate` includes evevry INFo about resources created like subnet id, AZ, Account ID etc
- After you `destroy` => current terraform.tfstate file renamed as `terraform.tfstate.backup` and a new `terraform.tfstate` file with present changes made
- `tf validate` commands validates config, shares error like - unsupported args, undeclared variable with line number and debug info..
- like in ec2 resource block give sky = 'blue' // give var.exmaple without doing => variable "environment" {}
- TF Plan auto runs validate bTS
```sh
terraform validate -var="env=true"
╷
│ Error: Failed to parse command-line flags
│ 
│ flag provided but not defined: -var
```
### vs 
```sh
terraform validate                
╷
│ Error: Unsupported argument
│
│   on vpc.tf line 73, in resource "aws_iam_group" "grp":
│   73:   mangu = aansh
│
│ An argument named "mangu" is not expected here.
```
