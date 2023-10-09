variable "rg_name"  {
    type = string
    default = "nhhsabet"
    description = "Resource Group name"
}

variable "sa_name"  {
    type = string
    default = "nhhsaweb"
    description = "Storage Account name"
}

variable "rg_location" {
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
    default = "<h1>Web page created with Terraform!! Omg</h1><p>hi</p>"
    description = "Content of webpage"
}