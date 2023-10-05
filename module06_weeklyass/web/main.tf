resource "azurerm_resource_group" "nhh_web_rg" {
  name     = "${var.rg_name}-${local.workspaces_suffix}"
  location = var.location
}

resource "azurerm_storage_account" "nhh_web_sa" {
  name                     = "${var.sa_name}${local.workspaces_suffix}"
  resource_group_name      = azurerm_resource_group.nhh_web_rg.name
  location                 = azurerm_resource_group.nhh_web_rg.location
  account_tier             = "Standard"
  account_replication_type = "GRS"

    static_website  {
        index_document = var.index_document
    }

    tags =  local.common_tags
}

resource "azurerm_storage_container" "nhh_web_sc" {
  name                  = "${var.sc_name}-${local.workspaces_suffix}"
  storage_account_name  = azurerm_storage_account.nhh_web_sa.name
  container_access_type = "private"
}

resource "azurerm_storage_blob" "nhh_web_sb" {
  name                   = var.index_document
  storage_account_name   = azurerm_storage_account.nhh_web_sa.name
  storage_container_name = "$web"
  type                   = "Block"
  content_type           = "text/html"
  source_content         = "${var.source_content}<h3>${local.workspaces_suffix}</h3>"
}

output "primary_web_endpoint" {
  value = azurerm_storage_account.nhh_web_sa.primary_web_endpoint
}