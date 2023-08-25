output "name" {
  value = azurerm_mssql_server.sqlserver.name
}
output "url" {
  value = azurerm_mssql_server.sqlserver.fully_qualified_domain_name
}
output "id" {
  value = azurerm_mssql_server.sqlserver.id
  
}