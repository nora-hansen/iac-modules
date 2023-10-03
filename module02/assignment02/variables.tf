variable "location" {
    type = string
    description = "Deployment location"
    default = "West Europe"
}

variable "rgname" {
    type = string
    description = "Resource Group Name"
    default = "nhh-rg-01-we"
}

variable "nsgname" {
    type = string
    description = "Network Security Group Name"
    default = "nhhnsg8799"
}

variable "vnetname" {
    type = string
    description = "Virtual Network Name"
    default = "nhhvnet12345"
}

variable "subnetname" {
    type = string
    description = "Subnet Name"
    default = "subnet"
}