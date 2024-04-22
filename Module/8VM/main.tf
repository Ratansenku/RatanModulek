data "azurerm_network_interface" "datanic" {
    for_each = var.vms
  name                = each.value.nicname
  resource_group_name = each.value.resource_group_name
}
resource "azurerm_linux_virtual_machine" "vm" {
    for_each = var.vms
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  size                = each.value.size
  admin_username      = each.value.admin_username
  admin_password      = each.value.admin_password
  computer_name       = each.value.computer_name
  disable_password_authentication = false
  network_interface_ids = [data.azurerm_network_interface.datanic[each.key].id]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-focal"
    sku       = "20_04-lts"
    version   = "latest"
  }
}