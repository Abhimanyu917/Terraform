# data "azurerm_subnet" "datasubnet" {
#   for_each             = var.child_bastion
#   name                 = each.value.subnet_name
#   virtual_network_name = each.value.virtual_network_name
#   resource_group_name  = each.value.resource_group_name
# }
