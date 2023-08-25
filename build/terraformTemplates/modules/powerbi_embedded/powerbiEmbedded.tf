resource "azurerm_powerbi_embedded" "pbi_embedded" {
  name                = "pbi${var.name}${var.env}${var.instance}"
  location            = var.location
  resource_group_name = var.resource_group_name
  sku_name            = var.sku_name
  administrators      = var.admin_members_email
  mode = "Gen2"

  tags = {
    env         = var.env
    
  }

  lifecycle {
    ignore_changes = [tags]
  }

}
