resource "azurerm_log_analytics_workspace" "log_analytics_workspace" {
  name                = "laws-${var.name}-${var.env}-${var.location_shorthand}-${var.instance}"
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = var.sku
  retention_in_days   = var.retention_in_days

 tags = {
    env         = var.env
    
  }

  lifecycle {
    ignore_changes = [tags]
  }

}