output "static_site_name" {
  description = "The name of the created static site"
  value       = azurerm_static_site.stapp.name
}

output "static_site_resource_group_name" {
  description = "The name of the resource group of the created static site"
  value       = azurerm_static_site.stapp.resource_group_name
}

output "static_site_location" {
  description = "The location of the created static site"
  value       = azurerm_static_site.stapp.location
}

output "static_site_api_key" {
  description = "The SKU tier of the created static site"
  value       = azurerm_static_site.stapp.api_key
  sensitive = true
}


