terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.71.0"
    }
    random = {
      source = "hashicorp/random"
      version = "3.5.1"
    }
  }
}

provider "azurerm" {
  features {}
}

provider "random" {
  # Configuration options
}

resource "random_string" "random" {
  length           = 5
  special          = false
  upper = false
}

module "ResourceGroup"  {
    source = "./ResourceGroup"
    base_name = "oeving05"
    location = "westeurope"
}

module "VirtualNet" {
    source = "./VirtualNet"
    base_name = "oeving05"
    rgname = module.ResourceGroup.rg_name_output
    location = module.ResourceGroup.location_output
    vnetname = "nhh-vnet-"
    nsgname = "nhh-nsg-"
    subnet1 = "subnet${random_string.random.result}"
    company = var.company
    project = var.project
    billing_code = var.billing_code
}