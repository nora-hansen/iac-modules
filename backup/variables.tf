variable "rg_name"  {
    type = string
    description = "Name of the resource group"
}

variable "rg_location"  {
    type = string
    description = "Deployment location of the resource group"
}

variable "sa_backend_name"  {
    type = string
    description = "Name of the storage account"
}

variable "sc_backend_name"  {
    type = string
    description = "Name of the storage container"
}

variable "sa_backend_accesskey_name"    {
    type = string
    description = "Name of acceskey"
}

variable "kv_backend_name"  {
    type = string
    description = "Key Vault name"
}