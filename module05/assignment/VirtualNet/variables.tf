variable "vnetname" {
    type = string
    description = "Virtual Network Name"
}

variable "nsgname"  {
    type = string
    description = "Network Security Group Name"
}

variable "base_name"    {
    type = string
    description = "Base name"
}

variable "rgname" {
    type = string
    description = "Resource group name"
}

variable "location" {
    type = string
    description = "Deployment location"
}

variable "subnet1"  {
    type = string
    description = "Name of subnet 1"
}

variable "company"  {
    type = string
    description = "Company name"
}

variable "project" {
    type = string
    description = "Project name"
}

variable "billing_code" {
    type = string
    description = "Billing code"
}