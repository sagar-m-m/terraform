resource "azurerm_app_configuration" "app_configuration" {
  name                = "appcs-${var.name}-${var.env}-${var.instance}"
  resource_group_name = var.resource_group_name
  location            = var.location
  sku = var.sku_name
  local_auth_enabled = true
  purge_protection_enabled = true
  soft_delete_retention_days = 7

  identity {
    type = "SystemAssigned"
  }
  
  tags = {
    env         = var.env
    
  }

  lifecycle {
    ignore_changes = [tags]
  }

}
