resource "azurerm_app_service_custom_hostname_binding" "domain" {
  hostname            = var.hostname
  app_service_name    = var.app_service_name
  resource_group_name = var.resource_group_name
}