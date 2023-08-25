data "azurerm_service_plan" "asp" {
  name                = var.asp_name
  resource_group_name = var.asp_resource_group_name
}

data "azurerm_log_analytics_workspace" "laws" {
  name                = var.laws_name
  resource_group_name = var.laws_resource_group_name
}

data "azurerm_user_assigned_identity" "managed_identity" {
  name                = var.managed_identity_name
  resource_group_name = var.managed_identity_resource_group_name
}

module "storage_account" {
  source                   = "../../../modules/storage_account"
  resource_group_name      = var.resource_group_name
  location                 = var.location
  env                      = var.env
  instance                 = ""
  source_type              = "fn"
  name                     = var.function_app_name
  account_tier             = var.storage_account_tier
  account_replication_type = var.storage_account_replication_type

}


module "application_insights" {
  source              = "../../../modules/application_insights"
  resource_group_name = var.resource_group_name
  location            = var.location
  env                 = var.env
  instance            = var.instance
  workspace_id        = data.azurerm_log_analytics_workspace.laws.id
  name                = "func-${var.function_app_name}-${var.env}-${var.location_map[var.location]}-${var.instance}"
  depends_on          = [data.azurerm_log_analytics_workspace.laws]

}


module "function_app" {
  source                             = "../../../modules/function_app_linux_netcore"
  resource_group_name                = var.resource_group_name
  location                           = var.location
  location_shorthand                 = var.location_map[var.location]
  env                                = var.env
  instance                           = var.instance
  name                               = var.function_app_name
  service_plan_id                    = data.azurerm_service_plan.asp.id
  storage_account_primary_access_key = module.storage_account.primary_access_key
  storage_account_name               = module.storage_account.name
  application_insights_key           = module.application_insights.instrumentation_key
  identity_ids                       = [data.azurerm_user_assigned_identity.managed_identity.id]



  depends_on = [
    data.azurerm_service_plan.asp,
    module.storage_account,
    module.application_insights
  ]

}
