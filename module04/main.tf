terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.46.0"
    }
  }
}

provider "azurerm" {
  # NOTE: Hard-coding subscription_id is OK for a lab, but avoid committing it for real projects.
  # Prefer using Azure CLI context (az login) or env vars (ARM_SUBSCRIPTION_ID) in CI.
  subscription_id = "7a3c6854-0fe1-42eb-b5b9-800af1e53d70"
  features {

  }
}

resource "azurerm_resource_group" "ng" {
  name     = local.rg_name
  location = var.location
  tags     = local.common_tags
}

module "network" {
  source      = "./network"
  rgname      = azurerm_resource_group.ng.name
  location    = var.location
  environment = var.environment
  nsgname     = local.nsg_name
  vnetname    = local.vnet_name
  subnetname  = local.snet_name
  # Addressing comes from tfvars (prod/dev)
  vnet_address_space = var.vnet_address_space
  subnet_prefixes    = var.subnet_prefixes
  tags               = var.tags
}

module "compute" {
  source       = "./compute"
  rgname       = azurerm_resource_group.ng.name
  location     = var.location
  environment  = var.environment
  vmname       = local.vm_name
  vmsize       = var.vmsize
  computername = local.computer_name
  nicname      = local.nic_name
  # Wire NIC to the subnet created by the network module
  subnet_id = module.network.subnet_id
  tags      = var.tags
  # Never hard-code paswards in code for real projects; ok for a lab.
  admin_password = var.admin_password
  admin_username = var.admin_username
}
