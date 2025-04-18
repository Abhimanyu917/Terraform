root-rg = {
  rg1 = {
    name     = "devsingh-rg"
    location = "East US"
  }
}

root-vnet = {
  vnet1 = {
    name                = "devsingh-vnet"
    location            = "East US"
    resource_group_name = "devsingh-rg"
    address_space       = ["10.0.0.0/16"]

  }
}

root-subnet = {
  subnet1 = {
    name                 = "devsubnet"
    resource_group_name  = "devsingh-rg"
    address_prefixes     = ["10.0.1.0/24"]
    virtual_network_name = "devsingh-vnet"
  }
}

root_vm = {
  "vm" = {
    vm_name="dev-linuxvm"
    location            = "East US"
    resource_group_name = "devsingh-rg"
    virtual_network_name = "devsingh-vnet"
    subnet_name         = "devsubnet"
    admin_username      = "abhimanyu"
    admin_password      = "Admin@@123"
    nic_name             = "devsingh-nic"
    vm_size             = "Standard_B1s"
    ip_configuration= {
      name                          = "ipconfig1"
      private_ip_address_allocation = "Dynamic"
    }
    
  }
}
