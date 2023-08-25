resource "azurerm_network_security_group" "nsg" {
  name                = "nsg-${var.name}-${var.env}-${var.location_shorthand}-${var.instance}"
  location            = var.location
  resource_group_name = var.resource_group_name
}
