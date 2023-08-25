resource "azurerm_mssql_database" "mssql_database" {
  name                        = "sqldb-${var.name}-${var.env}-${var.instance}"
  server_id                   = var.server_id
  collation                   = var.collation
  max_size_gb                 = var.max_db_size
  sku_name                    = var.sku_name
  auto_pause_delay_in_minutes = 600
  zone_redundant              = false
  min_capacity                = 0.5


  tags = {
    env         = var.env
    
  }

  lifecycle {
    ignore_changes = [tags]
  }

}
