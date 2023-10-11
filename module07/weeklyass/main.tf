resource "azurerm_resource_group" "nhh-rg" {
  name     = "nhh-${local.rg_name}-${var.location}"
  location = var.location
}

resource "random_string" "random" {
  length           = 6
  special          = false
  upper            = false
}

resource "azurerm_storage_account" "nhh-sa" {
  name                     = "nhh${local.sa_name}${random_string.random.result}"
  resource_group_name      = azurerm_resource_group.nhh-rg.name
  location                 = azurerm_resource_group.nhh-rg.location
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    environment = terraform.workspace
  }
}

output "saname" {
  value = azurerm_storage_account.nhh-sa.name
}