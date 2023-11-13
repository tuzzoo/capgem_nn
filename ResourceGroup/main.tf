
resource "azurerm_resource_group" "nn_rg" {
  name     = var.rg_name
  location = var.rg_location
}
