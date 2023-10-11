resource "random_string" "rg-id" {
  length           = 4
  special          = false
  upper            = false
}

//  Name format: basename-type-environment-location-xxxx (eg.: otas-rg-dev-westeurope-1234)
resource "azurerm_resource_group" "nhhotassarg" {
  name     = "${var.base-name}-${var.rg-name}-${var.env}-${var.location}-${random_string.rg-id.result}"
  location = var.location
}

resource "azurerm_storage_account" "nhhotassa" {
  name                     = "${lower("${var.sa-name}${random_string.rg-id.result}")}"
  resource_group_name      = azurerm_resource_group.nhhotassarg.name
  location                 = azurerm_resource_group.nhhotassarg.location
  account_tier             = var.sa-tier
  account_replication_type = var.sa-rep-type

  tags = var.common_tags
}

resource "azurerm_storage_container" "nhhotassc" {
  name                  = "${var.sc-name}${random_string.rg-id.result}"
  storage_account_name  = azurerm_storage_account.nhhotassa.name
  container_access_type = var.container-accs-type
}