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
//  Storage Account variables
//
variable "sa-name"  {
    type = string
    default = "storageaccount"
    description = "Storage Account name"
}

variable "sa-tier"  {
    type = string
    default = "Standard"
    description = "Storage Account tier (Standard, Premium)"

    validation {
        condition = contains(["Standard", "Premium"], var.sa-tier)
        error_message = "Invalid input. Accepted inputs: \"Standard\", \"Premium\""
    }
}

variable "sa-rep-type"  {
    type = string
    default = "GRS"
    description = "Storage Account replication type (LRS, GRS, RAGRS, ZRS, GZRS, RAGZRS)"

    validation {
        condition = contains (["LRS", "GRS", "RAGRS", "ZRS", "GZRS", "RAGZRS"], var.sa-rep-type)
        error_message = "Invalid input. Accepted inputs: \"LRS\", \"GRS\", \"RAGRS\", \"ZRS\", \"GZRS\", \"RAGZRS\""
    }
}

//
//  Storage Container variables
//
variable "sc-name"  {
    type = string
    default = "vhds"
    description = "Storage Container name"
}

variable "container-accs-type"  {
    type = string
    default = "private"
    description = "[Optional] Container Access Type (blob, container, private)"
}