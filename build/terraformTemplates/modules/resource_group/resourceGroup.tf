resource "azurerm_resource_group" "rg" {
  name     = "rg-${var.name}-${var.env}-${var.location_shorthand}-${var.rg_instance}"
  location = var.location

  tags = {
    env = var.env
    
  }
  
}