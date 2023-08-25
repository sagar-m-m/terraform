output "id" {
  description = "ID of the MSSQL database"
  value       = azurerm_mssql_database.mssql_database.id
}

output "name" {
  description = "Name of the MSSQL database"
  value       = azurerm_mssql_database.mssql_database.name
}
