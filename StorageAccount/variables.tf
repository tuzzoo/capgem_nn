#Input variables file for StorageAccount module

variable "strgacc_rgname" {
  type = string
  description = "Resource Group name"
  }

variable "strgacc_location" {
  type = string
  description = "Default location for resources"
  //default = "polandcentral" 
  }

variable "strgacc_name" {
  type = string
  description = "Storage account name"
  //default = "strgacc"
}

variable "strgacc_tier" {
  type = string
  description = "Storage account Tier"
  //default = "Standard"
}

variable "strgacc_repltype" {
  type = string
  description = "Storage account replication type"
  //default = "LRS"
}