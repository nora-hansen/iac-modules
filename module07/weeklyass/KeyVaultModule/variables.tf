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

//
//  Key Vault variables
//
variable "kv-name"  {
    type = string
    default = "kv"
    description = "Key Vault name"
}

variable "sa-access-key"    {
    type = string
    description = "Storage Account Access Key"
}

variable "vm-username"  {
    type = string
    description = "Virtual Machine username"
}

variable "vm-password"  {
    type = string
    description = "Virtual Machine password"
}