#Input variables file for AppServicePlan module

variable "fnapp_rgname" {
  type = string
  description = "Resource Group name"
  }

variable "fnapp_location" {
  type = string
  description = "Default location for resources"
  }

variable "fnapp_name" {
  type = string
  description = "Function App name"
  //default = "fnapp"
}

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

variable "acr_image_name" {
  type = string
  description = "Name of the container image"
}

variable "acr_image_tag" {
  type = string
  description = "Tag of the container image"
}

variable "fnapp_strgacc_key" {
  type = string
  description = "Function App - Storage Acc Key"
}

variable "fnapp_strgacc_name" {
  type = string
  description = "Function App - Storage Acc Name"
}

variable "fnapp_svcplan_id" {
  type = string
  description = "Function App - Service Paln id"
}

