output "id" {
    value = azurerm_virtual_machine.virtual_machine.id
}
output "name" {
    value = azurerm_virtual_machine.virtual_machine.name
  
}

output "username" {
  value = data.azurerm_key_vault_secret.username.value
}

output "password" {
  value = data.azurerm_key_vault_secret.password.value
}