/*
Multi-line comment
*/

terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.24.0"
    }
  }
}

provider "azurerm" {
  subscription_id = "6751c795-4fa9-49cc-b593-xxxxxxxx"
  client_id       = "98d70488-dc9b-43ff-813b-xxxxxxx"
  client_secret   = "ZLf8Q~Px_S~l-Vx8pYfsiO0A5I9xxxxxxxxxx"
  tenant_id       = "05902c17-b586-4a82-a1b0-xxxxxxxx"
}

resource "azurerm_resource_group" "first-RG"{
  name="terraform-grp" 
  location="North Europe"
}
