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

resource "azurerm_resource_group" "nhhrg" {
  name     = "nhh-rg-we"
  location = "West Europe"
}

resource "azurerm_storage_account" "nhhsa" {
  name                     = "nhhsa01"
  resource_group_name      = azurerm_resource_group.nhhrg.name
  location                 = azurerm_resource_group.nhhrg.location
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {

  }
}

resource "azurerm_network_security_group" "nhhsg" {
  name                = "nhhsg01"
  location            = azurerm_resource_group.nhhrg.location
  resource_group_name = azurerm_resource_group.nhhrg.name
}

resource "azurerm_virtual_network" "nhhvnet" {
  name                = "nhhvnet01"
  location            = azurerm_resource_group.nhhrg.location
  resource_group_name = azurerm_resource_group.nhhrg.name
  address_space       = ["10.0.0.0/16"]
  dns_servers         = ["10.0.0.4", "10.0.0.5"]

  subnet {
    name           = "nhh-subnet-01"
    address_prefix = "10.0.1.0/24"
  }

  subnet {
    name           = "nhh-subnet-02"
    address_prefix = "10.0.2.0/24"
  }

  subnet {
    name           = "nhh-subnet-03"
    address_prefix = "10.0.3.0/24"
  }

  tags = {
    
  }
}