resource "azurerm_resource_group" "nhh_rg" {
  name     = var.rg_name
  location = var.location
}

resource "azurerm_storage_account" "nhh_sa" {
  name                     = var.sa_name
  resource_group_name      = azurerm_resource_group.nhh_rg.name
  location                 = azurerm_resource_group.nhh_rg.location
  account_tier             = "Standard"
  account_replication_type = "GRS"
}

resource "azurerm_storage_container" "nhh_sc" {
  name                  = var.sc_name
  storage_account_name  = azurerm_storage_account.nhh_sa.name
  container_access_type = "private"
}