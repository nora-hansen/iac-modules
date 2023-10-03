resource "azurerm_network_security_group" "nhhnsg" {
  name                = "${var.nsgname}${var.base_name}"
  location            = var.location
  resource_group_name = var.rgname
}

resource "azurerm_network_security_rule" "nhhnsr"  {
  name                        = "Allow-Public-Ip"
  priority                    = 100
  direction                   = "Outbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix = "46.9.13.115"
  destination_address_prefix  = "*"
  resource_group_name         = var.rgname
  network_security_group_name = azurerm_network_security_group.nhhnsg.name
}

resource "azurerm_virtual_network" "nhhvnet" {
  name                = "${var.vnetname}${var.base_name}"
  location            = var.location
  resource_group_name = var.rgname
  address_space       = ["10.0.0.0/16"]
  dns_servers         = ["10.0.0.4", "10.0.0.5"]

  subnet {
    name           = var.subnet1
    address_prefix = "10.0.1.0/24"
  }

  tags = local.common_tags
}