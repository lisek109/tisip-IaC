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


resource "azurerm_resource_group" "rg-example-modul03" {
  name     = local.resource_group_name
  location = var.location
  tags     = local.tags
}

resource "azurerm_storage_account" "sa-example-modul03" {
  name                = local.storage_account_name
  resource_group_name = azurerm_resource_group.rg-example-modul03.name
  # for location bruker jeg her verdi fra azurerm_resource_group for å ha samme location på begge steder. 
  location                 = azurerm_resource_group.rg-example-modul03.location
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = local.tags
}
