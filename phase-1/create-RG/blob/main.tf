/*
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.0"
    }
  }
}
*/
# provide credentials 

/*
provider "azurerm" {
  subscription_id = "xxxxxxxxxxxxxxxxxxxxxxx"
  client_id       = "9xxxxxxxxxxxxxxxxxx"
  client_secret   = "Zxxxxxxxxxxxxxxxxxxxxxxx"
  tenant_id       = "0xxxxxxxxxxxxxxxxxxxxxxxx"
  features {}
}
*/


resource "azurerm_resource_group" "rg" {
  name     = "tf-hcl-lang"
  location = "West Europe"
}

resource "azurerm_storage_account" "acc" {
  name                     = "ananaytf"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "blob-service" {
  name                  = "content"
  storage_account_name  = azurerm_storage_account.acc.name
  container_access_type = "private"
}

resource "azurerm_storage_blob" "blob-1" {
  name                   = "sample data for blob"
  storage_account_name   = azurerm_storage_account.acc.name
  storage_container_name = azurerm_storage_container.blob-service.name
  type                   = "Block"
  source                 = "./sample-data-for-blob.txt"
}

output "url" {
  value = azurerm_storage_blob.blob-1.url
}
