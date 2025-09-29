resource "azurerm_network_interface" "nic" {
  name                = var.nicname
  location            = var.location
  resource_group_name = var.rgname
  tags                = merge({ environment = var.environment }, var.tags)

  ip_configuration {
    name                          = "primary"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_windows_virtual_machine" "vm" {
  name                = var.vmname
  resource_group_name = var.rgname
  location            = var.location
  size                = var.vmsize
  computer_name       = var.computername
  admin_username      = var.admin_username
  admin_password      = var.admin_password
  network_interface_ids = [
    azurerm_network_interface.nic.id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
  }

  tags = merge({ environment = var.environment }, var.tags)
}
