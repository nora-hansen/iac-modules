variable "rg_name"  {
    type = string
    default = "rg"
    description = "Resource Group Name"
}

variable "location" {
    type = string
    default = "westeurope"
    description = "Deployment Location"
}

variable "sa_name"  {
    type = string
    default = "sa"
    description = "Storage Account Name"
}