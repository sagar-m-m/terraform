resource "azurerm_static_site" "stapp" {
  name                = "stapp-${var.name}-${var.env}-${var.location_shorthand}-${var.instance}"
  resource_group_name = var.resource_group_name
  location            = var.location
  sku_tier            = var.sku_tier


  tags = {
    env         = var.env
    
  }


  lifecycle {
    ignore_changes = [tags]

  }


}
