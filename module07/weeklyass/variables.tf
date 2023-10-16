//
//  Root Module Variables
//
variable "base-name" {
  type        = string
  default     = "nhh-otas"
  description = "Base name"
}

variable "env" {
  type        = string
  default     = "dev"
  description = "Environment"
}

variable "location" {
  type        = string
  default     = "westeurope"
  description = "Deployment location"
}

//
//  Locals Variables
//
variable "company" {
  type        = string
  default     = "OperaTerraAS"
  description = "Company name"
}

variable "project" {
  type        = string
  default     = "NetVMAndStore" // It's the best I could come up with
  description = "Project name"
}

#
# Network variables
#

#
# Virtual Network variables
#
variable "vnet-name" {
  type        = string
  default     = "vnet"
  description = "Virtual Network name"
}

variable "addr-space" {
  type        = list(string)
  default     = ["10.0.0.0/16"]
  description = "Address space of the virtual network"
}

variable "dns-servers" {
  type        = list(string)
  default     = ["10.0.0.4", "10.0.0.5"]
  description = "DNS Servers for the virtual network"
}

#
# Subnet variables
#
variable "subnet-name" {
  type        = string
  default     = "subnet"
  description = "Subnet name"
}

variable "addr-pref" {
  type        = list(string)
  default     = ["10.0.2.0/24"]
  description = "Address prefixes for the subnet"
}

#
# Network Security Group variables
#
variable "nsg-name" {
  type        = string
  default     = "unnamedNsg"
  description = "Network Security Group name"
}

variable "security-rule-name" {
  type        = string
  default     = "unnamedSecurityRule"
  description = "Security Rule name"
}

variable "security-priority" {
  type        = number
  default     = 100
  description = "Priority of the security rule (Number between 100 - 4096)"

  validation {
    condition     = var.security-priority >= 100 && var.security-priority <= 4096
    error_message = "Value must be in range: 100 - 4096"
  }
}

variable "security-direction" {
  type        = string
  default     = "Inbound"
  description = "Direction of traffic (Inbound, Outbound)"

  validation {
    condition     = contains(["Inbound", "Outbound"], var.security-direction)
    error_message = "Invalid input. Accepted inputs: \"Inbound\", \"Outbound\""
  }
}

variable "security-access" {
  type        = string
  default     = "Allow"
  description = "Security Rule Access (Allow, Deny)"

  validation {
    condition     = contains(["Allow", "Deny"], var.security-access)
    error_message = "Invalid input. Accepted inputs: \"Allow\", \"Deny\""
  }
}

variable "security-protocol" {
  type        = string
  default     = "Tcp"
  description = "Security rule protocol"

  validation {
    condition     = contains(["Tcp", "Udp", "Tcmp", "Esp", "Ah", "*"], var.security-protocol)
    error_message = "Invalid input. Accepted inputs: \"Tcp\", \"Udp\", \"Tcmp\", \"Esp\", \"Ah\", \"*\""
  }
}

//
//  Storage Account variables
//
variable "sa-name" {
  type        = string
  default     = "sa"
  description = "Storage Account name"
}

variable "sa-tier" {
  type        = string
  default     = "Standard"
  description = "Storage Account tier (Standard, Premium)"

  validation {
    condition     = contains(["Standard", "Premium"], var.sa-tier)
    error_message = "Invalid input. Accepted inputs: \"Standard\", \"Premium\""
  }
}

variable "sa-rep-type" {
  type        = string
  default     = "GRS"
  description = "Storage Account replication type (LRS, GRS, RAGRS, ZRS, GZRS, RAGZRS)"

  validation {
    condition     = contains(["LRS", "GRS", "RAGRS", "ZRS", "GZRS", "RAGZRS"], var.sa-rep-type)
    error_message = "Invalid input. Accepted inputs: \"LRS\", \"GRS\", \"RAGRS\", \"ZRS\", \"GZRS\", \"RAGZRS\""
  }
}

//
//  Storage Container variables
//
variable "sc-name" {
  type        = string
  default     = "vhds"
  description = "Storage Container name"
}

variable "container-accs-type" {
  type        = string
  default     = "private"
  description = "[Optional] Container Access Type (blob, container, private)"

  validation {
    condition     = contains(["blob", "container", "private"], var.container-accs-type)
    error_message = "Invalid input. Accepted inputs: \"blob\", \"container\", \"private\""
  }
}


//
//  Network Interface variables
//
variable "ni-name" {
  type        = string
  default     = "ni"
  description = "Network Interface name"
}

variable "ip-config-name" {
  type        = string
  default     = "ipconfig"
  description = "IP Configuration name"
}

variable "priv-ip-addr-alloc" {
  type        = string
  default     = "Dynamic"
  description = "Private IP Address Allocation"
}

variable "subnet-id" {
  type        = string
  default     = "0"
  description = "Subnet ID"
}

//
//  Public IP variables
//
variable "pip-name" {
  type        = string
  default     = "pip"
  description = "Public IP Name"
}

variable "pip-alloc-method" {
  type        = string
  default     = "Static"
  description = "Public IP Allocation Method"

  validation {
    condition     = contains(["Static", "Dynamic"], var.pip-alloc-method)
    error_message = "Invalid input. Accepted inputs: \"Static\", \"Dynamic\""
  }
}

//
//  Virtual Machine variables
//
variable "vm-name" {
  type        = string
  default     = "linux-vm"
  description = "Virtual Machine name"
}

variable "vm-size" {
  type        = string
  default     = "Standard_F2"
  description = "Virtual Machine size"
}

variable "vm-sku" {
  type        = string
  default     = "20_04-lts"
  description = "Virtual Machine SKU (Stock-keeping-Unit)"
}