variable "rg_name"  {
    type = string
    description = "Name of the resource group"
}

variable "rg_location"  {
    type = string
    description = "Deployment location of the resource group"
}

variable "sa_name"  {
    type = string
    description = "Storage Account name"
}

variable "source_content"   {
    type = string
    description = "Source content for the index.html file"
}

variable "index_document"   {
    type = string
    description = "Name of index document"
}