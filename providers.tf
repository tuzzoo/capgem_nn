terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.78.0"
    }
  }  
  // Using remote backend on Azure blob storage account for statefile 
  backend "azurerm" {
      resource_group_name   = "cgnn23-tfm-rg"
      storage_account_name  = "cgnn23tfmstorage01"
      container_name        = "cgnn23tfstate"
      key            = "tfmpipeline/terraform.tfstate"
  }
}

provider "azurerm" {
    features {}
  
}