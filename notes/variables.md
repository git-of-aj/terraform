### Base Terraform Configuration (Before any modification)
```sh
provider "aws" {
  region     = "us-west-2"
  access_key = "YOUR-ACCESS-KEY"
  secret_key = "YOUR-SECRET-KEY"
}

resource "aws_instance" "myec2" {
   ami = "ami-082b5a644766e0e6f"
   instance_type = "t2.micro"
}
```
### Final Modified Terraform Configuration:
```sh
provider "aws" {
  region     = "us-west-2"
  access_key = "YOUR-ACCESS-KEY"
  secret_key = "YOUR-SECRET-KEY"
}

resource "aws_instance" "myec2" {
   ami = "ami-082b5a644766e0e6f"
   instance_type = var.instancetype
}
```
### variables.tf

```sh
variable "instancetype" {
  default = "t2.micro"
}
```
❓❓❓ What Happens if you don't specify default value above?
- TF asks you for value when you run TF plan / Apply
- like this - ` terraform plan
var.allow_ip
  Enter a value:`
```sh
variable "name" {
  default = "Terraform"
}

variable "allow_ip" {}
```
### terraform.tfvars

```sh
instancetype="t2.large"
```
## Loading Variable Values from CLI
```sh
terraform plan -var="instancetype=t2.small"
```
### Loading from custom tfvars file
```sh
terraform plan -var-file="custom.tfvars"
``` 

### Windows Specific Commands
```sh
setx TF_VAR_instancetype m5.large
echo %TF_VAR_instancetype
```

### Linux / MAC specific commands

```sh
export TF_VAR_instancetype t2.nano
echo TF_VAR_instancetype
```

## Conditions:
condition ? true-value: value-2-take-if-it's-false

```sh

provider "aws" {
  region     = "us-west-2"
  access_key = "YOUR-ACCESS-KEY"
  secret_key = "YOUR-SECRET-KEY"
}

# create this variable file here or in Variables.tf file...
variable "istest" {}

resource "aws_instance" "dev" {
   ami = "ami-082b5a644766e0e6f"
   instance_type = "t2.micro"
   count = var.istest == true ? 3 : 0
# the above line == count = 3 => when istest = True
}

resource "aws_instance" "prod" {
   ami = "ami-082b5a644766e0e6f"
   instance_type = "t2.large"
   count = var.istest == false ? 1 : 0
}

```
## Terraform Locals
> Terraform locals are best suited for defining values that are used internally within a configuration file or for calculations, while Terraform variables are ideal for customizing configurations, allowing reusability, and providing inputs from external sources.
**locals**:
- Common Configuration Values: like aws regions
- Calculations or Expressions:
  ```sh
  locals {
  num1 = 10
  num2 = 20
  sum  = local.num1 + local.num2
}

output "sum_result" {
  value = local.sum
}
  ```

**Variables**:
1. Customization and Inputs: When you want to provide input that can change for different environments, projects, or users. For instance, if you're deploying resources in different regions:
2. Dynamic Inputs: variables values canbe changed easily using tfvars etc methods
