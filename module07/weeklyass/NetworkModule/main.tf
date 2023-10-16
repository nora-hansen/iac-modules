resource "random_string" "rg-id" {
  length           = 4
  special          = false
  upper            = false
}

//  Name format: basename-type-environment-location-xxxx (eg.: otas-rg-dev-westeurope-1234)
resource "azurerm_resource_group" "nhhotasvnetrg" {
  name     = "${var.base-name}-${var.rg-name}-${var.env}-${var.location}-${random_string.rg-id.result}"
  location = var.location
}

resource "azurerm_network_security_group" "nhhotasnsg" {
  name                = "${var.base-name}-${var.nsg-name}-${var.env}-${random_string.rg-id.result}"
  location            = azurerm_resource_group.nhhotasvnetrg.location
  resource_group_name = azurerm_resource_group.nhhotasvnetrg.name

    security_rule {
    name                       = var.security-rule-name
    priority                   = var.security-priority
    direction                  = var.security-direction
    access                     = var.security-access
    protocol                   = var.security-protocol
    source_port_range          = "22"
    destination_port_range     = "*"
    source_address_prefix      = var.vm-pip
    destination_address_prefix = "*"
  }
}

resource "azurerm_virtual_network" "nhhotasvnet" {
  name                = "${var.subnet-name}${random_string.rg-id.result}"
  location            = azurerm_resource_group.nhhotasvnetrg.location
  resource_group_name = azurerm_resource_group.nhhotasvnetrg.name
  address_space       = var.addr-space
  dns_servers         = var.dns-servers

  tags = var.common_tags
}

resource "azurerm_subnet" "nhhotassubnet" {
  name                 = "${var.subnet-name}-${random_string.rg-id.result}"
  resource_group_name  = azurerm_resource_group.nhhotasvnetrg.name
  virtual_network_name = azurerm_virtual_network.nhhotasvnet.name
  address_prefixes     = var.addr-pref
}

resource "azurerm_subnet_network_security_group_association" "nhhotassubnetsgas" {
  subnet_id                 = azurerm_subnet.nhhotassubnet.id
  network_security_group_id = azurerm_network_security_group.nhhotasnsg.id
}