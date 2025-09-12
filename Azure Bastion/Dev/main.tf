module "dev-rg" {
  source   = "../Module/azurerm_rg"
  child_rg = var.root_rg

}

module "dev-vnet" {
  source     = "../Module/azurerm_vnet"
  child_vnet = var.root_vnet
  depends_on = [ module.dev-rg ]
}

module "dev-subnet" {
  source       = "../Module/azurerm_subnet"
  child_subnet = var.root_subnet
  depends_on   = [ module.dev-vnet ]
}

module "dev-vm" {
  source = "../Module/azurerm_vm"
  vms    = var.root_vm
  depends_on = [ module.dev-subnet ]
}

module "dev-bastion" {
  source        = "../Module/azurerm_bastion"
  child_bastion = var.root_bastion
  depends_on    = [ module.dev-subnet, module.dev-rg ]
}