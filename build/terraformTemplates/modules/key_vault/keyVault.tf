data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "key_vault" {
  name                       = "kv-${var.name}-${var.env}-${var.location_shorthand}-${var.instance}"
  location                   = var.location
  resource_group_name        = var.resource_group_name
  sku_name                   = var.sku_name
  tenant_id                  = data.azurerm_client_config.current.tenant_id
  purge_protection_enabled   = true
  soft_delete_retention_days = 7
  enable_rbac_authorization  = true


  tags = {
    env         = var.env
    
  }

  lifecycle {
    ignore_changes = [tags]
  }

}
