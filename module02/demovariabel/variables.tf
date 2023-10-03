# Variables for lab02
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