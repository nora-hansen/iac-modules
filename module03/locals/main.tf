terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.71.0"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "nhhrg" {
  name     = var.rgname
  location = var.az_regions[1]
}

resource "azurerm_storage_account" "nhhsa" {
  name                     = var.saname
  resource_group_name      = azurerm_resource_group.nhhrg.name
  location                 = azurerm_resource_group.nhhrg.location
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = local.common_tags
}

output "nhhsaid"  {
  value = azurerm_storage_account.nhhsa.id
}