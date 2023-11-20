
locals {
  tags = {
    assignment = "NN Dap"
    owner = "tuzzo"
  }
}

resource "azurerm_container_registry" "nn_acreg" {
  name                = var.acr_name
  resource_group_name = var.acr_rg_name
  location            = var.acr_location
  sku                 = var.acr_sku
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
        registry_url = azurerm_container_registry.nn_acreg.login_server //"https://cgnn23registry.azurecr.io"
        image_name = var.acr_image_name //"tuzzoopythonsamplevscodeflasktutorial"
        image_tag =  var.acr_image_tag //"latest"
      }
    }
    container_registry_use_managed_identity = true
    
  } 
  app_settings = {
    "DOCKER_ENABLE_CI"                                           = true
    "DOCKER_CUSTOM_IMAGE_NAME"                                   = "DOCKER|${azurerm_container_registry.nn_acreg.login_server}/${var.acr_image_name}:${var.acr_image_tag}"
    "WEBSITE_WEBDEPLOY_USE_SCM"                                  = true
    "WEBSITES_ENABLE_APP_SERVICE_STORAGE"                        = false
    "WEBSITES_PORT"                                              = "5000"
    "FUNCTIONS_WORKER_RUNTIME"                                   = "python"
  }
  identity {
    type = "SystemAssigned"
  }
  tags = local.tags
}

#Adding the webhook monitored by the Function App on the Container Registry
resource "azurerm_container_registry_webhook" "webhook" {
  # No dashes allowed in the name
  name                = "${replace(lower(azurerm_linux_function_app.nn_fn_app.name), "/\\W|_|\\s/", "")}webhook"
  resource_group_name = var.acr_rg_name
  location            = var.acr_location
  registry_name       = azurerm_container_registry.nn_acreg.name

  service_uri = "https://${azurerm_linux_function_app.nn_fn_app.site_credential[0].name}:${azurerm_linux_function_app.nn_fn_app.site_credential[0].password}@${lower(azurerm_linux_function_app.nn_fn_app.name)}.scm.azurewebsites.net/api/registry/webhook"
  status      = "enabled"
  scope       = "${var.acr_image_name}:${var.acr_image_tag}"
  actions     = ["push"]
  custom_headers = {
    "Content-Type" = "application/json"
  }
}

#Role assignment to allow the Function App pull images from the Container Registry 
resource "azurerm_role_assignment" "pull_image" {
  role_definition_name = "AcrPull"
  scope                = azurerm_container_registry.nn_acreg.id
  principal_id         = azurerm_linux_function_app.nn_fn_app.identity[0].principal_id
}



