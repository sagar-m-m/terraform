resource "azurerm_application_insights" "application_insights" {
  name                = "appin-${var.name}"
  location            = var.location
  resource_group_name = var.resource_group_name
  application_type    = "web"
  workspace_id = var.workspace_id
 tags = {
    env = var.env
    
  }

  lifecycle {
    ignore_changes = [tags]
    
  }

}

  