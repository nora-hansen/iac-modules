terraform {
    required_providers {
        azurerm = {
            source = "hashicorp/azurerm"
            version = "3.73.0"
        }
    }
    backend "azurerm" {
      resource_group_name = "nhhsabetw4ij32"
      storage_account_name = "nhhsaweb0kjld39bfw"
      container_name = "$web"
      key = "nhh-web.terraform.tfstate"
    }
}

provider "azurerm"  {
    features {}
}