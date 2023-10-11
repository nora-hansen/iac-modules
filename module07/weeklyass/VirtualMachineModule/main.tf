resource "random_string" "rg-id" {
  length           = 4
  special          = false
  upper            = false
}

//  Name format: basename-type-environment-location-xxxx (eg.: otas-rg-dev-westeurope-1234)
resource "azurerm_resource_group" "nhhotasvmrg" {
  name     = "${var.base-name}-${var.rg-name}-${var.env}-${var.location}-${random_string.rg-id.result}"
  location = var.location
}

resource "azurerm_network_interface" "nhhotasni" {
  name                = "${var.ni-name}-${random_string.rg-id.result}"
  location            = azurerm_resource_group.nhhotasvmrg.location
  resource_group_name = azurerm_resource_group.nhhotasvmrg.name

  ip_configuration {
    name                          = "${var.ip-config-name}-${random_string.rg-id.result}"
    subnet_id                     = var.subnet-id
    private_ip_address_allocation = var.priv-ip-addr-alloc
    public_ip_address_id          = azurerm_public_ip.nhhotaspip.id
  }
}

resource "azurerm_public_ip" "nhhotaspip"  {
    name = "${var.pip-name}-${random_string.rg-id.result}"
    resource_group_name = azurerm_resource_group.nhhotasvmrg.name
    location = azurerm_resource_group.nhhotasvmrg.location
    allocation_method = var.pip-alloc-method    # Static - Samme IP adresse, endres ikke
                                                # Dynamic - Ny IP adresse hver gang    
}


resource "azurerm_linux_virtual_machine" "nhhotasvm" {
  name                = "${var.vm-name}-${random_string.rg-id.result}"
  resource_group_name = azurerm_resource_group.nhhotasvmrg.name
  location            = azurerm_resource_group.nhhotasvmrg.location
  size                = var.vm-size
  admin_username      = var.vm-username
  admin_password      = var.vm-password
  disable_password_authentication = false
  network_interface_ids = [
    azurerm_network_interface.nhhotasni.id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "${var.sa-tier}_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-focal"
    sku       = var.vm-sku
    version   = "latest"
  }
  
  tags = var.common_tags
}