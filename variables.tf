variable "prefix" {
  description = "Common prefix for all resource names"
  default = "cgnn23"
}

variable "acrname" {
  type = string
  description = "Registry name"
}
variable "location"  {
    type = string
    description = "Azure region - location for the resources in the excercise."
    //default = "polandcentral"
}

variable "rgname" {
  type = string
  description = "Name of the resource group"
}

variable "acrsku" {
  type = string
  description = "SKU name for ACR"
}