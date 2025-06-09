locals {
  resource_group_name     = "modo-rg"
  resource_group_location = "East Asia"
  vnet_name               = "modo-vnet"
}

module "todorg" {
  source                  = "../Module/azurerm_resource_group"
  resource_group_name     = "modo-rg"
  resource_group_location = "East Asia"
}
module "modovnet" {
  source                  = "../Module/azurerm_vnet"
  vnet_name               = "modo-vnet"
  rg_name                 = local.resource_group_name
  resource_group_location = local.resource_group_location
  address_space           = ["10.0.0.0/16"]
  depends_on              = [module.todorg]

}
module "modo-subnet1" {
  source           = "../Module/azurerm_subnet"
  subnet_name      = "modo-frontendsubnet"
  rg_name          = local.resource_group_name
  vnet_name        = local.vnet_name
  address_prefixes = ["10.0.1.0/24"]
  depends_on       = [module.modovnet]


}
module "modo-subnet2" {
  source           = "../Module/azurerm_subnet"
  subnet_name      = "modo-backendsubnet"
  rg_name          = local.resource_group_name
  vnet_name        = local.vnet_name
  address_prefixes = ["10.0.2.0/24"]
  depends_on       = [module.modovnet]

}
module "modopip" {
  source                  = "../Module/azurerm_public_ip"
  pip_name                = "modo-pip"
  rg_name                 = local.resource_group_name
  resource_group_location = local.resource_group_location
  allocation_method       = "Static"
  depends_on              = [module.todorg]
}

module "frontend_vm" {
  source                  = "../Module/azurerm_virtual_machin"
  vm_name                 = "modofrontend"
  rg_name                 = local.resource_group_name
  resource_group_location = local.resource_group_location
  vm_size                 = "Standard_B1s"
  admin_username          = "adminuser"
  admin_password          = "Admin@112233"
  subnet_id               = "/subscriptions/1212a59c-637f-45eb-8b74-8032483be797/resourceGroups/modo-rg/providers/Microsoft.Network/virtualNetworks/modo-vnet/subnets/modo-frontendsubnet"
  image_publisher         = "Canonical"
  image_offer             = "0001-com-ubuntu-server-jammy"
  image_sku               = "22_04-lts-gen2"
  image_version           = "latest"
  nic_name                = "modo-nic"
  pip                     = module.modopip.pip_id
  depends_on              = [module.todorg, module.modovnet, module.modo-subnet1]

}
