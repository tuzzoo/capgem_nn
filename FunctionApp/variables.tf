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