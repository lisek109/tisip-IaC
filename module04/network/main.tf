# Creates NSG, VNet, Subnet and associates the NSG to the Subnet.

resource "azurerm_network_security_group" "nsg" {
  name                = var.nsgname
  location            = var.location
  resource_group_name = var.rgname

  # Tag NSG to track ownership/costs
  tags = merge({ environment = var.environment }, var.tags)
}

resource "azurerm_virtual_network" "vnet" {
  name                = var.vnetname
  location            = var.location
  resource_group_name = var.rgname
  address_space       = var.vnet_address_space

  tags = merge({ environment = var.environment }, var.tags)
}

resource "azurerm_subnet" "subnet" {
  name                 = var.subnetname
  resource_group_name  = var.rgname
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = var.subnet_prefixes
}

resource "azurerm_subnet_network_security_group_association" "subsg" {
  subnet_id                 = azurerm_subnet.subnet.id
  network_security_group_id = azurerm_network_security_group.nsg.id
}
