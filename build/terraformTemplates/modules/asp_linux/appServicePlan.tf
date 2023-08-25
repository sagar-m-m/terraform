resource "azurerm_service_plan" "app_service_plan" {
  name                =  "asp-${var.name}-${var.env}-${var.location_shorthand}-${var.instance}"
  location            = var.location
  resource_group_name = var.resource_group_name
  os_type = "Linux"
  sku_name = var.sku_name

  tags = {
    env = var.env
    
  }

  lifecycle {
    ignore_changes = [tags]
    
  }
}