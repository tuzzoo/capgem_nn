
locals {
  tags = {
    assignment = "NN Dap"
    owner = "tuzzo"
  }
}

resource "azurerm_linux_function_app" "nn_fn_app" {
  name = var.fnapp_name
  resource_group_name = var.fnapp_rgname
  location = var.fnapp_location
  storage_account_name = var.fnapp_strgacc_name
  storage_account_access_key = var.fnapp_strgacc_key
  service_plan_id = var.fnapp_svcplan_id

  site_config {
    application_stack {
      docker {
        registry_url = "cgnn23registry.azurecr.io"
        image_name = "tuzzoopythonsamplevscodeflasktutorial"
        image_tag =  "latest"
      }
    }
    container_registry_use_managed_identity = true
    
  } 

  tags = local.tags
}
