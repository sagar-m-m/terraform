output "id" {
  description = "The ID of the App Configuration"
  value       = azurerm_app_configuration.app_configuration.id
}

output "name" {
  description = "The name of the App Configuration"
  value       = azurerm_app_configuration.app_configuration.name
}

output "endpoint" {
  description = "The endpoint of the App Configuration"
  value       = azurerm_app_configuration.app_configuration.endpoint
}

output "identity" {
  description = "The managed service identity of the App Configuration"
  value       = azurerm_app_configuration.app_configuration.identity
}
