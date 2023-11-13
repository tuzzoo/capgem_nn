output "out_strg_acc_name" {
  value = azurerm_storage_account.nn_strg_acc.name
}

output "out_strg_acc_key" {
  value = azurerm_storage_account.nn_strg_acc.primary_access_key
}