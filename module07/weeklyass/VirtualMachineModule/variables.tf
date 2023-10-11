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

variable "common_tags"  {
  type = map(string)
  default = {company = "CompanyName"}
  description = "Common tags"
}

variable "rg-name"  {
    type = string
    default = "rg"
    description = "Resource Group name"
}

//
//  Network Interface variables
//
variable "ni-name"  {
    type = string
    default = "ni"
    description = "Network Interface name"
}

variable "ip-config-name"   {
    type = string
    default = "ipconfig"
    description = "IP Configuration name"
}

variable "priv-ip-addr-alloc"   {
    type = string
    default = "Dynamic"
    description = "Private IP Address Allocation"
}

variable "subnet-id"    {
    type = string
    description = "Subnet ID"
}

//
//  Public IP variables
//
variable "pip-name" {
    type = string
    default = "pip"
    description = "Public IP Name"
}

variable "pip-alloc-method" {
    type = string
    default = "Static"
    description = "Public IP Allocation Method"

    validation  {
        condition = contains(["Static", "Dynamic"], var.pip-alloc-method)
        error_message = "Invalid input. Accepted inputs: \"Static\", \"Dynamic\""
    }
}

//
//  Virtual Machine variables
//
variable "vm-name"  {
    type = string
    default = "linux-vm"
    description = "Virtual Machine name"
}

variable "vm-size"  {
    type = string
    default = "Standard_F2"
    description = "Virtual Machine size"
}

variable "vm-sku"   {
    type = string
    default = "20_04-lts"
    description = "Virtual Machine SKU (Stock-keeping-Unit)"
}

variable "sa-tier" {
    type = string
    description = "Storage Account type"
}

variable "vm-username"   {
    type = string
    description = "Username of the administrator user of the Virtual Machine"
}

variable "vm-password"   {
    type = string
    description = "Password of the administrator user of the Virtual Machine"
}