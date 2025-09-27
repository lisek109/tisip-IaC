terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.39.0"
    }
  }
}

provider "azurerm" {
  subscription_id = "7a3c6854-0fe1-42eb-b5b9-800af1e53d70"
  features {

  }
}

resource "azurerm_resource_group" "fd-rg" {
  name     = "rg-demo-we-lisek" # Use a unique name for the resource group, prefix or suffix with your initials tim-demo-rg-we / rg-demo-we-tim
  location = "West Europe"
}

resource "azurerm_storage_account" "sa-demo" {
  name                     = "lisekstorageaccount"
  resource_group_name      = azurerm_resource_group.fd-rg.name
  location                 = azurerm_resource_group.fd-rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

}
