output "key_vault_vm_username_output"   {
    value = azurerm_key_vault_secret.nhhotasvmusername.value
}

output "key_vault_vm_password_output"   {
    value = azurerm_key_vault_secret.nhhotasvmpassword.value
}