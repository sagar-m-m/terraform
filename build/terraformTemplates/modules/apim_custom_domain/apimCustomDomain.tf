data "azurerm_key_vault" "ssl_cert_kv" {
  name                = var.ssl_cert_kv_name
  resource_group_name = var.ssl_cert_kv_resource_group_name
}
data "azurerm_key_vault_certificate" "ssl_cert" {
  name         = var.ssl_cert_name
  key_vault_id = data.azurerm_key_vault.ssl_cert_kv.id
}

resource "azurerm_api_management_custom_domain" "apim_custom_domain" {
  api_management_id = var.api_management_id

  gateway {
    host_name    = var.gateway_hostname
    key_vault_id = data.azurerm_key_vault_certificate.ssl_cert.versionless_secret_id
  }
}