terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.71.0"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "nhh-rg" {
  name     = "nhh-rg-01"
  location = "westeurope"
}

resource "azurerm_virtual_network" "nhh-vnet" {
  name                = "enhh-vnet-0001"
  location            = azurerm_resource_group.nhh-rg.location
  resource_group_name = azurerm_resource_group.nhh-rg.name
  address_space       = ["10.0.0.0/16"]
  dns_servers         = ["10.0.0.4", "10.0.0.5"]
}

resource "azurerm_subnet" "nhh-subnet" {
  name                 = "nhh-subnet-0001"
  resource_group_name  = azurerm_resource_group.nhh-rg.name
  virtual_network_name = azurerm_virtual_network.nhh-vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_network_security_group" "nhh-nsg" {
  name                = "nhh-nsg-demo-01"
  location            = azurerm_resource_group.nhh-rg.location
  resource_group_name = azurerm_resource_group.nhh-rg.name

  security_rule {
    name                       = "Allow-Public-IP"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "46.9.13.115"    # Hvilken adresse som prøver å koble seg til? 
    destination_address_prefix = "*"
  }
}

# Hekter på security groupen på subnettet
resource "azurerm_subnet_network_security_group_association" "example" {
  subnet_id                 = azurerm_subnet.nhh-subnet.id
  network_security_group_id = azurerm_network_security_group.nhh-nsg.id
}

resource "azurerm_public_ip" "nhh-pip"  {
    name = "nhh-pip-linux"
    resource_group_name = azurerm_resource_group.nhh-rg.name
    location = azurerm_resource_group.nhh-rg.location
    allocation_method = "Static"    # Static - Samme IP adresse, endres ikke
                                    # Dynamic - Ny IP adresse hver gang    
}

resource "azurerm_network_interface" "nhh-nic" {
  name                = "nhh-nic"
  location            = azurerm_resource_group.nhh-rg.location
  resource_group_name = azurerm_resource_group.nhh-rg.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.nhh-subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = azurerm_public_ip.nhh-pip.id
  }
}

resource "azurerm_linux_virtual_machine" "example" {
  name                = "example-machine"
  resource_group_name = azurerm_resource_group.nhh-rg.name
  location            = azurerm_resource_group.nhh-rg.location
  size                = "Standard_F2"
  admin_username      = "noraadminhei"
  admin_password      = "adaMama:080899"
  disable_password_authentication = false
  network_interface_ids = [
    azurerm_network_interface.nhh-nic.id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-focal"
    sku       = "20_04-lts"
    version   = "latest"
  }
}