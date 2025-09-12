resource "azurerm_public_ip" "dev-pip" {
  for_each            = var.child_bastion
  name                = each.value.pip_name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  allocation_method   = "Static"
  sku                 = "Standard"
}

data "azurerm_subnet" "datasubnet" {
  for_each             = var.child_bastion
  name                 = each.value.subnet_name
  virtual_network_name = each.value.virtual_network_name
  resource_group_name  = each.value.resource_group_name
}

resource "azurerm_bastion_host" "dev-bastion" {
  for_each            = var.child_bastion
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  ip_configuration {
    name                 = "configuration"
    subnet_id            = data.azurerm_subnet.datasubnet[each.key].id
    public_ip_address_id = azurerm_public_ip.dev-pip[each.key].id
  }
}
