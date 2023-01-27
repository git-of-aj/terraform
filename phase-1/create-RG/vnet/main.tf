# to give command line argument 

# run the below command in terminal 

#  terraform plan -var="vnet-2=192.168.0.0"



resource "azurerm_resource_group" "rg" {
  name     = "TF-resources"
  location = "West Europe"
}

resource "azurerm_network_security_group" "nsg" {
  name                = "example-security-group"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}


resource "azurerm_virtual_network" "vnet" {
  count = 3 
  name                = "terraform-vnet.${count.index}"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
#   address_space       = var.cidr[count.index]
 address_space = "10.0.0.0/16"


#   subnet {
#     # count = 3 -- validate sya count can appera here 
# #     The "count" object can only be used in "module", "resource", and "data" blocks, and only when the "count" argument 
# # │ is set.
#     name           = "subnet.${count.index}"
#     address_prefix = ["var.prefix.${count.index}"]
#   }

  
  tags = {
    environment = "Production"
    manager     = "ananay"
  }
}

# Creating vnet=2

# resource "azurerm_virtual_network" "vnet-2" {
#   name                = "example-network"
#   location            = "centralindia"
#   resource_group_name = azurerm_resource_group.rg.name
#   address_space       = ["${var.vnet_2}/16"]


#   subnet {
#     name           = "subnet1"
#     address_prefix = ["${var.vnet_2}/16"]
#   }
  
# }

