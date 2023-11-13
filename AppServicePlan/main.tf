

locals {
  tags = {
    assignment = "NN Dap"
    owner = "tuzzo"
  }
}

resource "azurerm_service_plan" "nn_svc_plan" {
  name = var.svcplan_name
  resource_group_name = var.svcplan_rgname
  location = var.svcplan_location
  sku_name = var.svcplan_sku
  os_type = "Linux" 

  tags = local.tags
}
