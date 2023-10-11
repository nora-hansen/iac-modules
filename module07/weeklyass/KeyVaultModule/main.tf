data "azurerm_client_config" "current" {}

resource "random_string" "rg-id" {
  length           = 4
  special          = false
  upper            = false
}

//  Name format: basename-type-environment-location-xxxx (eg.: otas-rg-dev-westeurope-1234)
resource "azurerm_resource_group" "nhhotaskvrg" {
  name     = "${var.base-name}-${var.rg-name}-${var.env}-${var.location}-${random_string.rg-id.result}"
  location = var.location
}

resource "azurerm_key_vault" "nhhotaskv" {
  name                        = "${var.base-name}-${var.kv-name}-${random_string.rg-id.result}"
  location                    = azurerm_resource_group.nhhotaskvrg.location
  resource_group_name         = azurerm_resource_group.nhhotaskvrg.name
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false

  sku_name = "standard"

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions = [
      "Create",
      "Get",
    ]

    secret_permissions = [
      "Set",
      "Get",
      "Delete",
      "Purge",
      "Recover"
    ]

    storage_permissions = [
      "Get",
    ]
  }

  tags = var.common_tags
}

//
//  Virtual Machine Credentials
//
resource "azurerm_key_vault_secret" "nhhotasvmusername" {
  name         = "vm-username"
  value        = var.vm-username
  key_vault_id = azurerm_key_vault.nhhotaskv.id
}

resource "azurerm_key_vault_secret" "nhhotasvmpassword" {
  name         = "vm-password"
  value        = var.vm-password
  key_vault_id = azurerm_key_vault.nhhotaskv.id
}

//
//  Storage Account Access Key
//
resource "azurerm_key_vault_secret" "nhhotassakey"  {
  name         = "sa-access-key"  
  value        = var.sa-access-key
  key_vault_id = azurerm_key_vault.nhhotaskv.id
}