resource "azurerm_resource_group" "nhhrg" {
  name     = "nhh-rg-${var.base_name}"
  location = var.location
}