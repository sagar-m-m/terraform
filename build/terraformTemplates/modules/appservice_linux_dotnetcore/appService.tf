resource "azurerm_linux_web_app" "wapp_linux" {
  name                = "app-${var.name}-${var.env}-${var.location_shorthand}-${var.instance}"
  resource_group_name = var.resource_group_name
  location            = var.location
  service_plan_id     = var.service_plan_id

  site_config {

    use_32_bit_worker   = true
    always_on           = true
    ftps_state          = "Disabled"
    http2_enabled       = true
    minimum_tls_version = 1.2
    application_stack {
      dotnet_version = var.dotnet_version
    }


  }

  app_settings = {

    "APPINSIGHTS_INSTRUMENTATIONKEY" = var.application_insights_key
  }

  https_only = true

  identity {
    type = "SystemAssigned"
  }


  tags = {
    env         = var.env
    
  }

  lifecycle {
    ignore_changes = [tags,app_settings]


  }
}