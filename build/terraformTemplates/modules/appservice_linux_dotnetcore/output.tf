output "name" {
  description = "The name of the created Linux Web App"
  value       = azurerm_linux_web_app.wapp_linux.name
}

output "default_hostname" {
  description = "The default hostname of the created Linux Web App"
  value       = azurerm_linux_web_app.wapp_linux.default_hostname
}

output "identity" {
  value = azurerm_linux_web_app.wapp_linux.identity.0.principal_id
}