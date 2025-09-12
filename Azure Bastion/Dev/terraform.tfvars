root_rg = {
  rg1 = {
  name     = "dev-rg"
  location = "East Asia"
  }
}

root_vnet = {
  vnet1 = {
  name                = "dev-vnet"
  address_space       = ["10.0.0.0/16"]
  location            = "East Asia"
  resource_group_name = "dev-rg"
}}

root_subnet = {
  subnet1 = {
  name                 = "dev-subnet"
  resource_group_name  = "dev-rg"
  virtual_network_name = "dev-vnet"
  address_prefixes     = ["10.0.1.0/24"]
  }

  subnet2 = {
  name                 = "AzureBastionSubnet"
  resource_group_name  = "dev-rg"
  virtual_network_name = "dev-vnet"
  address_prefixes     = ["10.0.2.0/27"]
  }
}

root_vm = {
  vm1 = {
    vm_name             = "dev-vm1"
    location            = "East Asia"
    resource_group_name = "dev-rg"
    subnet_name         = "dev-subnet"
    vnet_name           = "dev-vnet"
    admin_username      = "adminuser"
    admin_password      = "Admin@112233"
    nic_name            = "dev-nic1"
  }
}

root_bastion = {
  bastion1 = {
    name                = "dev-bastion"
    location            = "East Asia"
    resource_group_name = "dev-rg"
    pip_name            = "dev-bastion-pip"
    subnet_name         = "AzureBastionSubnet" 
    virtual_network_name = "dev-vnet" 
  }
}