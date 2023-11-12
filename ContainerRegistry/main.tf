provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "nn_rg" {
  name     = "${var.prefix}resource-group"
  location = "${var.location}"
}

resource "azurerm_container_registry" "nn_acreg" {
  name                = "${var.prefix}registry"
  resource_group_name = "${azurerm_resource_group.nn_rg.name}"
  location            = "${azurerm_resource_group.nn_rg.location}"
  sku                 = "Basic"
}