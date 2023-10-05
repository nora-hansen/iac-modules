terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.71.0"
    }
  }

#     backend "azurerm" {
#     resource_group_name = "nhh-rg-web"
#     storage_account_name = "sawebweek61"
#     container_name = "$web"
#     key = "nhh-web.terraform.tfstate"
#   }
}

provider "azurerm" {
  features {
  }
}