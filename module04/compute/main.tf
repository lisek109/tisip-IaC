# Creates a NIC in the provided subnet and a Windows VM bound to that NIC.

resource "azurerm_network_interface" "nic" {
  name                = var.nicname
  location            = var.location
  resource_group_name = var.rgname
  tags                = merge({ environment = var.environment }, var.tags)

  ip_configuration {
    name                          = "primary"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
    # NOTE: No public IP
  }
}

resource "azurerm_windows_virtual_machine" "vm" {
  # Azure VM resource name (may exceed 15 chars)
  name                = var.vmname
  resource_group_name = var.rgname
  location            = var.location
  size                = var.vmsize
  # Windows hostname (MUST be <= 15 chars), otherwise provider throws an error.
  computer_name  = var.computername
  admin_username = var.admin_username
  admin_password = var.admin_password
  # Attach the NIC created above
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
