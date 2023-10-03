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
      key = "rg.terraform.tfstate"
    }
}

provider "azurerm" {
  features {
    key_vault {
      purge_soft_delete_on_destroy    = true
      recover_soft_deleted_key_vaults = true
    }
  }
}