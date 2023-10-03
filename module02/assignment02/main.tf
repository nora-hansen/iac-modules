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
  location = var.location
}

resource "azurerm_network_security_group" "nhhnsg" {
  name                = var.nsgname
  location            = azurerm_resource_group.nhhrg.location
  resource_group_name = azurerm_resource_group.nhhrg.name
}

resource "azurerm_virtual_network" "nhhvnet" {
  name                = var.vnetname
  location            = azurerm_resource_group.nhhrg.location
  resource_group_name = azurerm_resource_group.nhhrg.name
  address_space       = ["10.0.0.0/16"]
  dns_servers         = ["10.0.0.4", "10.0.0.5"]

  subnet {
    name           = var.subnetname
    address_prefix = "10.0.1.0/24"
  }

  tags = {
  }
}