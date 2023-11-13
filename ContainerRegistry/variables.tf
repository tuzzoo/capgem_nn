//Definitions of input variables for Azure Container Registry module

variable "acr_name" {
  type = string
  description = "Registry name"
}
variable "acr_location"  {
    type = string
    description = "Azure region - location for the resources in the excercise."
    //default = "polandcentral"
}

variable "acr_rg_name" {
  type = string
  description = "Name of the resource group for ACR"
}

variable "acr_sku" {
  type = string
  description = "SKU name for ACR"
}