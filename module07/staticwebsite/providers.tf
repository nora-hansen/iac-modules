terraform {
    required_providers {
        azurerm = {
            source = "hashicorp/azurerm"
            version = "3.73.0"
        }
    }
    backend "azurerm"   {
        resource_group_name = "nhhsabet"
        storage_account_name = "nhhsawebln8r1jn2"
        container_name = "$web"
        key = "web.terraform.nhhtfstate"
    }
}

provider "azurerm"  {
    features {}
}