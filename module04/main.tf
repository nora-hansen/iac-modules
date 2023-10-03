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

module "ResourceGroup" {
  source = "./ResourceGroup"    # Står i stående directory og går til denne
  base_name = "tf-demo-04"
  location = "westeurope"
}

module "StorageAccount" {
  source = "./StorageAccount"
  base_name = "tfDemo"
  rgname = module.ResourceGroup.rg_name_output
  location = "westeurope"
}