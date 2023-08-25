resource "azurerm_mssql_server" "sqlserver" {
  name                          = "sql-${var.name}-${var.env}-${var.instance}"
  resource_group_name           = var.resource_group_name
  location                      = var.location
  version                       = "12.0"
  administrator_login           = var.admin_username
  administrator_login_password  = var.admin_password
  minimum_tls_version           = "1.2"
  public_network_access_enabled = true


  identity {

    type = "SystemAssigned"

  }


  azuread_administrator {
    login_username              = var.azuread_admin_username
    object_id                   = var.azuread_admin_object_id
    azuread_authentication_only = false

  }
  tags = {
    env         = var.env
    
  }

  lifecycle {
    ignore_changes = [tags]
  }

}
