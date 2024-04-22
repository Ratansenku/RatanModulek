rgs = {
  rg1 = {
    name     = "rk_dev_rg"
    location = "poland central"
  }
}
vnets = {
  vnet1 = {
    name                = "rk_dev_vnet"
    location            = "poland central"
    resource_group_name = "rk_dev_rg"
    address_space       = ["10.0.0.0/16"]
  }
}
subnets = {
  subnet1 = {
    name                 = "rk_dev_frontendsubnet"
    resource_group_name  = "rk_dev_rg"
    virtual_network_name = "rk_dev_vnet"
    address_prefixes     = ["10.0.1.0/24"]
  }
  subnet2 = {
    name                 = "rk_dev_Backendsubnet"
    resource_group_name  = "rk_dev_rg"
    virtual_network_name = "rk_dev_vnet"
    address_prefixes     = ["10.0.2.0/24"]
  }
  # subnet3 = {
  #   name                 = "AzureBastionSubnet"
  #   resource_group_name  = "rk_dev_rg"
  #   virtual_network_name = "rk_dev_vnet"
  #   address_prefixes     = ["10.0.3.0/24"]
  # }
}
pips = {
  pip1 = {
    name                = "rk_dev_frontendpip"
    resource_group_name = "rk_dev_rg"
    location            = "poland central"
    allocation_method   = "Static"
    sku                 = "Standard"
  }
  pip2 = {
    name                = "rk_dev_Backendpip"
    resource_group_name = "rk_dev_rg"
    location            = "poland central"
    allocation_method   = "Static"
    sku                 = "Standard"
  }
  # pip3 = {
  #   name                = "rk_dev_Bastionpip"
  #   location            = "poland central"
  #   resource_group_name = "rk_dev_rg"
  #   allocation_method   = "Static"
  #   sku                 = "Standard"
  # }
  pip4 = {
    name                = "rk_dev_lbpip"
    resource_group_name = "rk_dev_rg"
    location            = "poland central"
    allocation_method   = "Static"
    sku                 = "Standard"
  }
}
nics = {
  nic1 = {
    name                 = "rk_dev_frontendnic"
    location             = "poland central"
    resource_group_name  = "rk_dev_rg"
    virtual_network_name = "rk_dev_vnet"
    subnetname           = "rk_dev_frontendsubnet"
    pipname              = "rk_dev_frontendpip"
  }
  nic2 = {
    name                 = "rk_dev_Backendnic"
    location             = "poland central"
    resource_group_name  = "rk_dev_rg"
    virtual_network_name = "rk_dev_vnet"
    subnetname           = "rk_dev_Backendsubnet"
    pipname              = "rk_dev_Backendpip"
  }
}
nsgs = {
  nsg = {
    name                = "rk_dev_nsg"
    location            = "poland central"
    resource_group_name = "rk_dev_rg"
  }
}
security_rule = {
  security_rule1 = {
    name                   = "SSH"
    priority               = "100"
    destination_port_range = "22"
  }
  security_rule2 = {
    name                   = "HTTP"
    priority               = "101"
    destination_port_range = "80"
  }
}
nsgas = {
  nsga1 = {
    name                 = "rk_dev_frontendnsga"
    virtual_network_name = "rk_dev_vnet"
    resource_group_name  = "rk_dev_rg"
    nsgname              = "rk_dev_nsg"
    subnetname           = "rk_dev_frontendsubnet"
  }
  nsga2 = {
    name                 = "rk_dev_Backendnsga"
    virtual_network_name = "rk_dev_vnet"
    resource_group_name  = "rk_dev_rg"
    nsgname              = "rk_dev_nsg"
    subnetname           = "rk_dev_Backendsubnet"
  }
}
vms = {
  vm1 = {
    name                = "rk_dev_frontendvm"
    resource_group_name = "rk_dev_rg"
    location            = "poland central"
    size                = "Standard_DS1_v2"
    admin_username      = "adminuser"
    admin_password      = "Rattukumar@989153"
    nicname             = "rk_dev_frontendnic"
    computer_name       = "LenovoVM"
  }
  vm2 = {
    name                = "rk_dev_Backendvm"
    resource_group_name = "rk_dev_rg"
    location            = "poland central"
    size                = "Standard_DS1_v2"
    admin_username      = "adminuser"
    admin_password      = "Rattukumar@989153"
    nicname             = "rk_dev_Backendnic"
    computer_name       = "LenovoVM"
  }
}
sqlss = {
  sqls = {
    name                         = "rkdevsqlserver"
    resource_group_name          = "rk_dev_rg"
    location                     = "poland central"
    version                      = "12.0"
    administrator_login          = "adminuser"
    administrator_login_password = "server@989153"
  }
}
sqldb = {
  sqldb = {
    name                = "rkdevsqldatabase"
    resource_group_name = "rk_dev_rg"
    location            = "poland central"
    server_name         = "rkdevsqlserver"
  }
}
# bastion_host = {
#   bastion_host = {
#     name                 = "rk_dev_Bastionhost"
#     resource_group_name  = "rk_dev_rg"
#     location             = "poland central"
#     virtual_network_name = "rk_dev_vnet"
#     subnetname           = "AzureBastionSubnet"
#     pipname              = "rk_dev_Bastionpip"
#   }
# }
keyvault = {
  keyvault = {
    name                = "rkdevkeyvault"
    location            = "poland central"
    resource_group_name = "rk_dev_rg"
  }
}
lb = {
  lb = {
    name                = "rk_dev_lb"
    location            = "poland central"
    resource_group_name = "rk_dev_rg"
    pipname             = "rk_dev_lbpip"
  }
}


# lbname             = "lb-todoapp"
# backendpool        = "todoapp_backendpool"
# backendpooladdress = "todoapp_backendaddress"

# vms = {
#   "vm-ratan-todoapp-frontend" = {
#     vmname                 = "vm-minhaj-todoapp-frontend"
#     network_interface_name = "nic-frontend-1"
#   },
#   "vm-ratan-todoapp-frontend2" = {
#     vmname                 = "vm-minhaj-todoapp-frontend2"
#     network_interface_name = "nic-frontend-2"
#   }
# }

# probename = "frontendprobe"
# port      = "80"
# protocol  = "Tcp"
# interval  = "5"

# lbrule       = "frontendrule"
# frontendport = "80"
# backendport  = "80"