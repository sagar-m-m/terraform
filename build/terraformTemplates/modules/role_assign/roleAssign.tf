data "azurerm_active_directory_group" "active_directory_group" {
  name = var.active_directory_group_name
}

resource "azurerm_role_assignment" "role_assignment" {
  scope                = var.scope
  role_definition_name = var.role_definition_name
  principal_id         = data.azurerm_active_directory_group.active_directory_group.object_id
}