output "custom_hostname_binding_id" {
  description = "The ID of the App Service custom hostname binding."
  value       = azurerm_app_service_custom_hostname_binding.domain.id
}

output "custom_hostname" {
  description = "The custom hostname used for the App Service."
  value       = azurerm_app_service_custom_hostname_binding.domain.hostname
}
