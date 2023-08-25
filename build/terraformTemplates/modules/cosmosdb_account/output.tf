output "cosmosdb_account_name" {
  value = azurerm_cosmosdb_account.cosmosdb_account.name
}
output "cosmosdb_account_url" {
  value = azurerm_cosmosdb_account.cosmosdb_account.endpoint
  
}