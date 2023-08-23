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

> Variables are used to parameterize your infrastructure code and make it more adaptable to different scenarios.
Data Sources enable you to retrieve information from external systems to use in your configuration, reducing hardcoding and enhancing flexibility.
Locals allow you to define calculated values or common configurations that can be reused across your Terraform codebase, reducing redundancy and improving maintainability.

1. **Terraform Variables:**
Terraform variables are placeholders that allow you to parameterize your infrastructure code. They enable you to make your configuration more flexible and reusable by providing a way to inject values from external sources into your Terraform code.

**Real-Life Use Case:**
Imagine you're deploying a web application, and you need to specify the number of instances to run in an auto-scaling group. Instead of hardcoding the number, you can use a Terraform variable. This variable can be set differently based on the environment, such as development, staging, or production, allowing you to scale the application according to the specific needs of each environment.

2. **Terraform Data Sources:**
Data sources in Terraform allow you to retrieve information from an existing infrastructure provider, such as cloud providers (AWS, Azure, GCP), databases, or other external systems. This data can then be used in your Terraform configuration to make informed decisions or create dependencies.

**Real-Life Use Case:**
Suppose you're setting up a virtual network in a cloud provider and want to ensure that your instances are placed within a specific subnet. Instead of hardcoding the subnet ID in your configuration, you can use a data source to fetch the subnet ID based on its name or other attributes. This ensures that your instances are always placed in the correct subnet, even if its ID changes over time.

3. **Terraform Locals:**
Locals in Terraform allow you to define intermediate values or calculations within your configuration that can be reused across different parts of your code. They are similar to variables but are intended for values that are derived from other inputs.

**Real-Life Use Case:**
Suppose you're deploying a complex application that requires multiple security groups with similar rules. Instead of duplicating the same rules in multiple places, you can use locals to define the common rules once and then reference them in each security group definition. This approach not only reduces duplication but also makes it easier to maintain consistent security settings.

