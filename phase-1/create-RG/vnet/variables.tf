
variable "name" {
  type = list 
 default = ["prod-vnet", "stage-vnet", "Q-A-vnet", "test-vnet"]
}

variable "cidr" {
  type = list 
  default = ["10.0.0.0/16", "168.16.0.0/16", "172.31.0.0/16"]
}

variable "location" {
  type = list 
  default = ["centralindia","southindia","westindia","eastus"]
}

# over-ride this by 
# terraform apply -var="condition=false"
variable "condition" {
  default = true
} # conditional expression requires only true or false 

variable "rg" {
  type = list 
 default = ["prod-rg", "stage-rg", "Q-A-rg", "test-rg"]
}

# repeatable values go in local varaible
locals {
  # Common tags to be assigned to all resources
  common_tags = {
    Environment  = "testing"
    Owner   = "Ananay"
  }
}

variable "address_prefix" {
  default = "10.0.0.0/16"
  # default value will be used if no value is set when calling the module or running Terraform  
}


variable "prefix1" {
  default = "10.0.1.0/24"
  type = string 
}

variable "prefix2" {
  default = "10.0.2.0/24"
  type = string 
}

variable "prefix3" {
  default = "10.0.3.0/24"
  type = string 
}

variable "sub-2" {
  type = string
  default = "10.0.2.0/24"
  
}

variable "vnet_2" {
  default = "16.8.0.0"
}
