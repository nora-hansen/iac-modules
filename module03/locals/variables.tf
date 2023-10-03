# Variables for module03
variable "location" {
  type        = string
  description = "Deployment location"
  default     = "West Europe"
}

variable "rgname" {
  type        = string
  description = "Resource group name"
  default     = "nhh-rg-demo-terraform"
}

variable "saname" {
  type        = string
  description = "Storage account name"
}

variable "company" {
  type        = string
  description = "Company name"
}

variable "project" {
  type        = string
  description = "Project name"
}

variable "billing_code" {
  type        = string
  description = "Billing code"
}

variable "az_regions"   {
    type = list(string)
    description = "Azure regions for resources"
    default = ["northeurope", "westeurope"]
}