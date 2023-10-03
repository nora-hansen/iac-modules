terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.71.0"
    }
  }

    backend "azurerm" {
      resource_group_name = "nhhsabetw4ij33"
      storage_account_name = "nhhsawrg7esbrkog31"
      container_name = "nhhsc8u0"
      key = "backend.terraform.tfstate"
    }
}

provider "azurerm" {
  features {
  }
}