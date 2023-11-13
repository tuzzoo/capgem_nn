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

variable "strgaccname" {
  type = string
  description = "Storage account name"
  //default = "strgacc"
}

variable "strgacctier" {
  type = string
  description = "Storage account Tier"
  //default = "Standard"
}

variable "strgaccrepltype" {
  type = string
  description = "Storage account replication type"
  //default = "LRS"
}

variable "svcplanname" {
  type = string
  description = "App Service Plan name"
}

variable "svcplansku" {
    type = string
    description = "App Service Plan SKU"
}