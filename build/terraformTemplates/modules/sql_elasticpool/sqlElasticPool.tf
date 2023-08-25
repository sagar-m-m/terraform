resource "azurerm_mssql_elasticpool" "elasticpool" {
  name                = "sqlep-${var.name}-${var.env}-${var.instance}"
  resource_group_name = var.resource_group_name
  location            = var.location
  server_name         = var.server_name
  license_type        = "LicenseIncluded"
  max_size_gb         = 32


  sku {
    name     = "GP_Gen5"
    tier     = "GeneralPurpose"
    family   = "Gen5"
    capacity = 2

  }

  per_database_settings {
    min_capacity = 0
    max_capacity = 2
  }

  tags = {
    env         = var.env
    
  }

  lifecycle {
    ignore_changes = [tags]
  }

}
