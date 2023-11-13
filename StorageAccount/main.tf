terraform {
  required_providers {
    random = {
      source = "hashicorp/random"
      version = "3.5.1"
    }
  }
}

resource "random_string" "random" {
  length = 6
  special = false
  upper = false
}

locals {
  tags = {
    assignment = "NN Dap"
    owner = "tuzzo"
  }
}

resource "azurerm_storage_account" "nn_strg_acc" {
  name = "${lower(var.strgacc_name)}${random_string.random.result}"
  resource_group_name = var.strgacc_rgname
  location = var.strgacc_location
  account_tier = var.strgacc_tier
  account_replication_type = var.strgacc_repltype 

  tags = local.tags
}
