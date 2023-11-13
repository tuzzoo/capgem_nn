terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.78.0"
    }
  }  
}

provider "azurerm" {
    features {}
  
}

locals {
  name = "Ciraltos"
  tags = {
    environment = "Lab"
    owner = "Travis"
  }
}

module "resourceGroup" {
  source = "./ResourceGroup"
  rg_name = "${var.prefix}${var.rgname}" 
  rg_location = "${var.location}"
}


module "containerRegistry" {
    source = "./ContainerRegistry"
    acr_name = "${var.prefix}${var.acrname}"     
    acr_location = var.location
    acr_rg_name = module.resourceGroup.out_rg_name
    acr_sku = var.acrsku
}

module "StorageAccount" {
  source = "./StorageAccount"
  strgacc_name = "${var.prefix}${var.strgaccname}"
  strgacc_location = var.location
  strgacc_rgname = module.resourceGroup.out_rg_name
  strgacc_repltype = var.strgaccrepltype
  strgacc_tier = var.strgacctier
  
}