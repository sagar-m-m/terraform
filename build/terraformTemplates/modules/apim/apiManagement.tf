resource "azurerm_api_management" "apim" {
  name                = "apims-${var.name}-${var.env}-${var.location_shorthand}-${var.instance}"
  location            = var.location
  resource_group_name = var.resource_group_name
  publisher_name      = var.publisher_name
  publisher_email     = var.publisher_email
  sku_name            = var.sku_name

  tags = {
    env         = var.env
    
  }

  identity {
    type = "SystemAssigned"
  }

  lifecycle {
    ignore_changes = [tags]

  }

}
