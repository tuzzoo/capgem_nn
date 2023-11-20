
locals {
  name = "Ciraltos"
  tags = {
    environment = "Lab"
    owner = "Travis"
  }
}

module "ResourceGroup" {
  source = "./ResourceGroup"
  rg_name = "${var.prefix}${var.rgname}" 
  rg_location = "${var.location}"
}


/*module "ContainerRegistry" {
    source = "./ContainerRegistry"
    acr_name = "${var.prefix}${var.acrname}"     
    acr_location = var.location
    acr_rg_name = module.ResourceGroup.out_rg_name
    acr_sku = var.acrsku
} */

module "StorageAccount" {
  source = "./StorageAccount"
  strgacc_name = "${var.prefix}${var.strgaccname}"
  strgacc_location = var.location
  strgacc_rgname = module.ResourceGroup.out_rg_name
  strgacc_repltype = var.strgaccrepltype
  strgacc_tier = var.strgacctier
  
}

module "AppServicePlan" {
  source = "./AppServicePlan"
  svcplan_location = var.location
  svcplan_name = "${var.prefix}${var.svcplanname}"
  svcplan_rgname = module.ResourceGroup.out_rg_name
  svcplan_sku = var.svcplansku
}

module "FunctionApp" {
  source = "./FunctionApp"

  acr_name = "${var.prefix}${var.acrname}"     
  acr_location = var.location
  acr_rg_name = module.ResourceGroup.out_rg_name
  acr_sku = var.acrsku
  acr_image_name = var.acrimagename
  acr_image_tag = var.acrimagetag

  fnapp_name = "${var.prefix}${var.fnappname}"
  fnapp_location = var.location
  fnapp_rgname = module.ResourceGroup.out_rg_name
  
  fnapp_strgacc_name = module.StorageAccount.out_strg_acc_name
  fnapp_strgacc_key = module.StorageAccount.out_strg_acc_key
  fnapp_svcplan_id = module.AppServicePlan.out_svcplan_id
}