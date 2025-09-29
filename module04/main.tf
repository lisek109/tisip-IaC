terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.46.0"
    }
  }
}

provider "azurerm" {
  subscription_id = "7a3c6854-0fe1-42eb-b5b9-800af1e53d70"
  features {

  }
}

locals {
  name_prefix = "${var.environment_short}-${var.project}"
}

resource "azurerm_resource_group" "ng" {
  name     = "${local.name_prefix}-rg-${var.seq}"
  location = var.location
  tags     = merge({ environment = var.environment }, var.tags)
}

module "network" {
  source             = "./network"
  rgname             = azurerm_resource_group.ng.name
  location           = var.location
  environment        = var.environment
  nsgname            = "${local.name_prefix}-nsg-001"
  vnetname           = "${local.name_prefix}-vnet-001"
  subnetname         = "${local.name_prefix}-snet-001"
  vnet_address_space = var.vnet_address_space
  subnet_prefixes    = var.subnet_prefixes
  tags               = var.tags
}

module "compute" {
  source         = "./compute"
  rgname         = azurerm_resource_group.ng.name
  location       = var.location
  environment    = var.environment
  vmname         = "${local.name_prefix}-vm-${var.seq}"
  vmsize         = var.vmsize
  computername   = "${var.environment_short}-vm-${var.seq}"
  nicname        = "${local.name_prefix}-nic-${var.seq}"
  subnet_id      = module.network.subnet_id
  tags           = var.tags
  admin_password = var.admin_password
  admin_username = var.admin_username
}
