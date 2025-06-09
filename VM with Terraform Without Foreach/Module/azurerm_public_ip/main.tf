resource "azurerm_public_ip" "modo-pip" {
    name = "var.pip_name"
    location = var.resource_group_location
    resource_group_name = var.rg_name
    allocation_method = var.allocation_method
  
}
output "pip_id" {
  description = "The ID of the Public IP"
  value       = azurerm_public_ip.modo-pip.id
}