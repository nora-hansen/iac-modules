resource "azurerm_resource_group" "example" {
  name     = "nhh-rg-${var.base_name}"  # Bruker base navnet :O Smart!
  # Kan også bruke:
  # format("nhh-rg-%s", var.base_name)
  # ^^ Er jo som i C!
  # Kan og fortsatt gjøre som vanlig:
  # "nhh-rg-${var.base_name}"
  # "nhh-rg-%s" % var.base_name fikk error... : 
  # "Unsuitable value for left operand: a number is required"
  location = var.location
}