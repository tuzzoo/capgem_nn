#Input variables file for AppServicePlan module

variable "svcplan_rgname" {
  type = string
  description = "Resource Group name"
  }

variable "svcplan_location" {
  type = string
  description = "Default location for resources"
  //default = "polandcentral" 
  }

variable "svcplan_name" {
  type = string
  description = "App Service Plan name"
  //default = "svcplan"
}

variable "svcplan_sku" {
  type = string
  description = "App Service Plan Tier"
  //default = "Y1"
}