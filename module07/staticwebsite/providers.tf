terraform {
    required_providers {
        azurerm = {
            source = "hashicorp/azurerm"
            version = "3.73.0"
        }
    }
    backend "azurerm" {
      resource_group_name = "nhhsabetw4ij32"
      storage_account_name = "nhhsaweb3rc0m4fzkl"
      container_name = "$web"
      key = "nhh-web-demo.terraform.tfstate"
    }
}

provider "azurerm"  {
    features {}
}