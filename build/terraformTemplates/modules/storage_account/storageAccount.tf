resource "azurerm_storage_account" "sa" {
  name                     = lower("sa${var.source_type}${var.name}${var.env}${var.instance}")
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = var.account_tier
  account_replication_type = var.account_replication_type


   tags = {
    env = var.env
    
  }

  lifecycle {
    ignore_changes = [tags]
    
  }
}