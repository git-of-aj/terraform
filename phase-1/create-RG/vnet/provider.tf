terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
    }
  }
}
# provide credentials 
provider "azurerm" {
  subscription_id = "xxxxxxxxxxxxx"
  client_id       = "xxxxxxxxxxxxx"
  client_secret   = "xxxxxxxxxxxxxxxxx"
  tenant_id       = "xxxxxxxxxxxxxxxxxxxxx"
  features {}
}
