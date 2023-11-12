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


module "containerRegistry" {
    source = "./ContainerRegistry"    
}