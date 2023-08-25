output "gateway_url" {
  value = azurerm_api_management.apim.gateway_url
}

output "identity" {
  value = azurerm_api_management.apim.identity.0.principal_id
}

output "id" {
  value = azurerm_api_management.apim.id
  
}
