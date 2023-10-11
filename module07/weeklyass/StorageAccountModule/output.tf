output "sa-connection-string-output" {
    value = azurerm_storage_account.nhhotassa.primary_connection_string
}

output "sa_type_output"    {
    value = azurerm_storage_account.nhhotassa.account_tier
}

output "sa_access_key_output"      {
    value = azurerm_storage_account.nhhotassa.primary_access_key
}