output "id" {
  description = "The ID of the Linux Function App."
  value       = azurerm_linux_function_app.func.id
}

output "name" {
  description = "The name of the Linux Function App."
  value       = azurerm_linux_function_app.func.name
}

output "default_hostname" {
  description = "The default hostname for the Linux Function App."
  value       = azurerm_linux_function_app.func.default_hostname
}
