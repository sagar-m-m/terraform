resource "azurerm_subnet" "snet" {
  name                 = "snet-${var.name}-${var.env}-${var.location_shorthand}-${var.instance}"
  address_prefixes     = [var.address_prefixes]
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.virtual_network_name
  

  dynamic "delegation" {

    for_each = var.enable_delegation ? [1] : []
    content {
      name = var.delegation_name
      service_delegation {
        name    = var.service_delegation_name
        actions = var.delegation_actions
      }


    }
  }
}


