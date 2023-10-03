terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.71.0"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "nhhrgwe" {
  name     = "nhh-rg-vnet-we"
  location = "West Europe"
}

resource "azurerm_network_security_group" "nhhnsg" {
  name                = "nhh-nsg-vnet01"
  location            = azurerm_resource_group.nhhrgwe.location
  resource_group_name = azurerm_resource_group.nhhrgwe.name
}

resource "azurerm_virtual_network" "nhhvnet" {
  name                = "nhh-vnet-01"
  location            = azurerm_resource_group.nhhrgwe.location
  resource_group_name = azurerm_resource_group.nhhrgwe.name
  address_space       = ["10.0.0.0/16"]
  dns_servers         = ["10.0.0.4", "10.0.0.5"]

  subnet {
    name           = "nhh-sn-01-we"
    address_prefix = "10.0.1.0/24"
  }

  subnet {
    name           = "nhh-sn-02-we"
    address_prefix = "10.0.2.0/24"
  }

  tags = {
  }
}