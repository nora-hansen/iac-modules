terraform {
    required_providers {
        azurerm = {
            source = "hashicorp/azurerm"
            version = "3.73.0"
        }
    }
    # backend "azurerm"   {
    #     resource_group_name = "nhhsabetw4ij32"
    #     storage_account_name = "nhhsaweb74ddfc2j"
    #     container_name = "$web"
    #     key = "web.terraform.nhhtfstate"
    # }
}

provider "azurerm"  {
    features {}
}