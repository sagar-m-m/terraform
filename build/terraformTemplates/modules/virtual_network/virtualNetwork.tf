resource "azurerm_virtual_network" "vnet" {
  name                = "vnet-${var.name}-${var.env}-${var.location_shorthand}-${var.instance}"
  address_space       = [var.address_space]
  location            = var.location
  resource_group_name = var.resource_group_name


 tags = {
    env = var.env
   
  } 

  lifecycle {
    ignore_changes = [tags]
    
  }

}

