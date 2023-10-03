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
  name     = var.rgname
  location = var.location
}

resource "azurerm_network_security_group" "nhhsg" {
  name                = var.sgname
  location            = azurerm_resource_group.nhhrg.location
  resource_group_name = azurerm_resource_group.nhhrg.name
}

resource "azurerm_virtual_network" "nhhvnet01" {
  name                = var.vnetname[0]
  location            = azurerm_resource_group.nhhrg.location
  resource_group_name = azurerm_resource_group.nhhrg.name
  address_space       = var.vnetas.vnet01
  dns_servers         = var.vnetdns.vnet01

  subnet {
    name           = var.subnetname.vnet01[0]
    address_prefix = var.subnetap.vnet01[0]
    security_group = azurerm_network_security_group.nhhsg.id
  }

  subnet {
    name           = var.subnetname.vnet01[1]
    address_prefix = var.subnetap.vnet01[1]
    security_group = azurerm_network_security_group.nhhsg.id
  }

  tags = local.common_tags
}

resource "azurerm_virtual_network" "nhhvnet02" {
  name                = var.vnetname[1]
  location            = azurerm_resource_group.nhhrg.location
  resource_group_name = azurerm_resource_group.nhhrg.name
  address_space       = var.vnetas.vnet02
  dns_servers         = var.vnetdns.vnet02

  subnet {
    name           = var.subnetname.vnet02[0]
    address_prefix = var.subnetap.vnet02[0]
    security_group = azurerm_network_security_group.nhhsg.id
  }

  subnet {
    name           = var.subnetname.vnet02[1]
    address_prefix = var.subnetap.vnet02[1]
    security_group = azurerm_network_security_group.nhhsg.id
  }

  tags = local.common_tags
}

resource "azurerm_storage_account" "nhhsa" {
  count = length(var.saname)
  name                     = var.saname[count.index]
  resource_group_name      = azurerm_resource_group.nhhrg.name
  location                 = azurerm_resource_group.nhhrg.location
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = local.common_tags
}