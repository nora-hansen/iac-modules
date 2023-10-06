variable "rg_name"  {
    type = string
    default = "nhhsabetw4ij32"
    description = "Resource Group name"
}

variable "sa_name"  {
    type = string
    default = "nhhsaweb3rc0m4fzkl"
    description = "Storage Account name"
}

variable "location" {
    type = string
    default = "westeurope"
    description = "Location"
}

variable "index_document"   {
    type = string
    default = "index.html"
    description = "Index Document name"
}

variable "source_content"   {
    type = string
    default = "<h1>Web page created with Terraform!! Oh my</h1><p>hi</p>"
    description = "Content of webpage"
}