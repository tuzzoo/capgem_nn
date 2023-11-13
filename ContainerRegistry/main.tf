provider "azurerm" {
  features {}
}

resource "azurerm_container_registry" "nn_acreg" {
  name                = var.acr_name
  resource_group_name = var.acr_rg_name
  location            = var.acr_location
  sku                 = var.acr_sku
}