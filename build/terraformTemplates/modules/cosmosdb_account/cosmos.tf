resource "azurerm_cosmosdb_account" "cosmosdb_account" {
  name = "cdbact-${var.name}-${var.env}-${var.instance}"
  resource_group_name = var.resource_group_name
  location = var.location
  offer_type = var.offer_type
  kind = var.kind

 capabilities {
   name = "EnableServerless"
   
 } 

backup {
  type = "Continuous"
} 
consistency_policy {
  consistency_level = "Session"
}
geo_location {
  location = var.location
  failover_priority = 0
}

tags = {
    env = var.env
    
  }

  lifecycle {
    ignore_changes = [tags]
  }
}

