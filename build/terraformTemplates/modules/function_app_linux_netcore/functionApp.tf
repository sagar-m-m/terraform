resource "azurerm_linux_function_app" "func" {
  name                       = "func-${var.name}-${var.env}-${var.location_shorthand}-${var.instance}"
  resource_group_name        = var.resource_group_name
  location                   = var.location
  storage_account_name       = var.storage_account_name
  storage_account_access_key = var.storage_account_primary_access_key
  service_plan_id            = var.service_plan_id

  site_config {

    use_32_bit_worker        = false
    always_on                = true
    ftps_state               = "Disabled"
    http2_enabled            = true
    minimum_tls_version      = 1.2
    application_insights_key = var.application_insights_key


    application_stack {
      dotnet_version = "6.0"

    }
  }
  identity {
    type         = "UserAssigned"
    identity_ids = var.identity_ids
  }

  functions_extension_version = "~4"
  https_only                  = true
  tags = {
    env         = var.env
    
  }


  lifecycle {
    ignore_changes = [
      tags,
      app_settings
    ]

  }


}
