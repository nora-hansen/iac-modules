variable "location" {
  type        = string
  description = "Deployment location"
  default     = "West Europe"
}

variable "rgname"   {
    type = string
    description = "Resource Group Name"
    default = "nhh-rg-ass-we-001"
}

variable "sgname"   {
    type = string
    description = "Security Group Names"
    default = "nhh-sg-ass-we"
}

variable "vnetname" {
    type = list(string)
    description = "Virtual Network Name"
    default = ["nhh-vnet-ass-we-001"]
}

variable "vnetas"   {
    type = map
    description = "Virtual Network Address Space"   
    default = {
        "vnet01" = ["10.0.0.0/16"]
    }
}

variable "vnetdns"   {
    type = map
    description = "Virtual Network DNS-Servers"
    default = {
        "vnet01" = ["10.0.0.4", "10.0.0.5"]
    }
}

variable "subnetap" {
  type = map
  description = "Address Prefixes for Subnets"
  default = {
    "subnet01" = ["10.0.1.0/24","10.0.2.0/24"]
  }
}

variable "subnetname" {
    type = map
    description = "Subnet Name"
    default = {
        "vnet01" = ["vnet01-subnet1"]
    }
}

variable "saname"   {
    type = list(string)
    description = "Storage Account Name"
    default = ["nhh-sa-ass-we-001"]
}

variable "company"  {
    type = string
    description = "Company Name"
}

variable "project"  {
    type = string
    description = "Project Name"
}

variable "billing"  {
    type = string
    description = "Billing Department"
}

variable "owner"    {
    type = string
    description = "Owner Name"
}