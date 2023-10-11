#
# General variables
#
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

variable "rg-name"  {
    type = string
    default = "rg"
    description = "Resource Group name"
}

variable "common_tags"  {
  type = map(string)
  default = {company = "CompanyName"}
  description = "Common tags"
}

variable "vm-pip"   {
    type = string
    description = "Public IP of the Virtual Machine"
}

#
# Network variables
#

#
# Virtual Network variables
#
variable "vnet-name" {
    type = string
    default = "vnet"
    description = "Virtual Network name"
}

variable "addr-space"   {
    type = list(string) 
    default = ["10.0.0.0/16"]
    description = "Address space of the virtual network"
}

variable "dns-servers"  {
    type = list(string)
    default = ["10.0.0.4", "10.0.0.5"]
    description = "DNS Servers for the virtual network"
}

#
# Subnet variables
#
variable "subnet-name"  {
    type = string
    default = "subnet"
    description = "Subnet name"
}

variable "addr-pref"    {
    type = list(string)
    default = ["10.0.2.0/24"]
    description = "Address prefixes for the subnet"
}

#
# Network Security Group variables
#
variable "nsg-name" {
    type = string
    default = "unnamedNsg"
    description = "Network Security Group name"
}

variable "security-rule-name"   {
    type = string
    default = "unnamedSecurityRule"
    description = "Security Rule name"
}

variable "security-priority"    {
    type = number
    default = 100
    description = "Priority of the security rule (Number between 100 - 4096)"

    validation {
        condition   = var.security-priority >= 100 && var.security-priority <= 4096
        error_message = "Value must be in range: 100 - 4096"
    }
}

variable "security-direction"   {
    type = string
    default = "Inbound"
    description = "Direction of traffic (Inbound, Outbound)"

    validation {
        condition = contains(["Inbound", "Outbound"], var.security-direction)
        error_message = "Invalid input. Accepted inputs: \"Inbound\", \"Outbound\""
    }
}

variable "security-access"  {
    type = string
    default = "Allow"
    description = "Security Rule Access (Allow, Deny)"

    validation {
        condition = contains(["Allow", "Deny"], var.security-access)
        error_message = "Invalid input. Accepted inputs: \"Allow\", \"Deny\""
    }
}

variable "security-protocol"    {
    type = string
    default = "Tcp"
    description = "Security rule protocol"

    validation  {
        condition = contains(["Tcp", "Udp", "Tcmp", "Esp", "Ah", "*"], var.security-protocol)
        error_message = "Invalid input. Accepted inputs: \"Tcp\", \"Udp\", \"Tcmp\", \"Esp\", \"Ah\", \"*\""
    }
}