resource "azurerm_virtual_network" "modovnet" {
    name = var.vnet_name
    resource_group_name = var.rg_name
    location = var.resource_group_location
    address_space = var.address_space
  
}

