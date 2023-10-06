variable "rg_name"  {
    type = string
    default = "nhhsabetw4ij32"
    description = "Resource Group name"
}

variable "sa_name"  {
    type = string
    default = "nhhsawebu4tt6qyh8l"
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