module "abhi-rg" {
  source   = "../Module/azurerm_rg"
  child-rg = var.root-rg

}

module "dev-vnet" {
  source     = "../Module/azurerm-vnet"
  child-vnet = var.root-vnet
  depends_on = [module.abhi-rg]
}

module "dev-subnet" {
  source = "../Module/azurerm-subnet"
  child-subnet = var.root-subnet
  depends_on = [ module.dev-vnet ]
}

module "dev-vm" {
    source   = "../Module/virtual-machine"
    vms = var.root_vm
    depends_on = [ module.dev-subnet ]
}