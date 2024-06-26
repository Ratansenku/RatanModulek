resource "azurerm_lb" "lb" {
  for_each = var.lb
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  frontend_ip_configuration {
    name                 = "PublicIPAddress"
    public_ip_address_id = data.azurerm_public_ip.pipdata[each.key].id
  }
}
data "azurerm_public_ip" "pipdata" {
  for_each = var.lb
  name                = each.value.pipname
  resource_group_name = each.value.resource_group_name
}



# resource "azurerm_lb" "lb_todoapp" {
#   name                = var.lbname
#   location            = data.azurerm_resource_group.todoapp_rgdatablock.location
#   resource_group_name = data.azurerm_resource_group.todoapp_rgdatablock.name
#   sku                 = "Standard"

#   frontend_ip_configuration {
#     name                 = data.azurerm_public_ip.todoapp_pipdatablock.name
#     public_ip_address_id = data.azurerm_public_ip.todoapp_pipdatablock.id
#   }
# }

# resource "azurerm_lb_backend_address_pool" "lb_backendpool_todoapp" {
#   loadbalancer_id = azurerm_lb.lb_todoapp.id
#   name            = var.backendpool
# }

# # resource "azurerm_lb_backend_address_pool_address" "lb_backend_address_pool" {
# #   name                    = var.backendpooladdress
# #   backend_address_pool_id = azurerm_lb_backend_address_pool.lb_backendpool_todoapp.id
# #   virtual_network_id      = data.azurerm_virtual_network.todoapp_vnetdatablock.id
# #   ip_address              = "10.0.0.1"
# # }

# resource "azurerm_network_interface_backend_address_pool_association" "todoapp_lbnicascn" {
#   for_each                = var.vms
#   network_interface_id    = data.azurerm_network_interface.vminterface[each.key].id
#   ip_configuration_name   = "internal"
#   backend_address_pool_id = azurerm_lb_backend_address_pool.lb_backendpool_todoapp.id
# }

# resource "azurerm_lb_probe" "todoapp_lbhealthprobe" {
#   loadbalancer_id     = azurerm_lb.lb_todoapp.id
#   name                = var.probename
#   port                = var.port
#   protocol            = var.protocol
#   interval_in_seconds = var.interval
# }

# resource "azurerm_lb_rule" "todoapp_lbrule" {
#   loadbalancer_id                = azurerm_lb.lb_todoapp.id
#   name                           = var.lbrule
#   protocol                       = var.protocol
#   frontend_port                  = var.frontendport
#   backend_port                   = var.backendport
#   frontend_ip_configuration_name = data.azurerm_public_ip.todoapp_pipdatablock.name
#   probe_id                       = azurerm_lb_probe.todoapp_lbhealthprobe.id
#   backend_address_pool_ids       = [azurerm_lb_backend_address_pool.lb_backendpool_todoapp.id]
# }
# data "azurerm_resource_group" "todoapp_rgdatablock" {
#   name = "rg-todoApp-ratan"
# }

# data "azurerm_virtual_network" "todoapp_vnetdatablock" {
#   name                = "vnet-todoApp-ratan"
#   resource_group_name = "rg-todoApp-ratan"
# }

# data "azurerm_public_ip" "todoapp_pipdatablock" {
#   name                = "pip-lb-frontend"
#   resource_group_name = data.azurerm_resource_group.todoapp_rgdatablock.name
# }

# data "azurerm_network_interface" "vminterface" {
#   for_each            = var.vms
#   name                = each.value.network_interface_name
#   resource_group_name = data.azurerm_resource_group.todoapp_rgdatablock.name
# }


# # data "azurerm_lb" "todoapp_lbdatablock" {
# #   name                = "lb-todoapp"
# #   resource_group_name = data.azurerm_resource_group.todoapp_rgdatablock.name
# # }