terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.71.0"
    }
  }

    backend "azurerm" {
    resource_group_name = "nhh-rg"
    storage_account_name = "nhhsaweekly6"
    container_name = "nhhtfstate"
    key = "nhh.terraform.tfstate"
  }
}

provider "azurerm" {
  features {
  }
}