output "function_app_name_full" {
  description = "The name of the Function App"
  value       = module.function_app.name
}

output "storage_account_name" {
  description = "The name of the Storage Account"
  value       = module.storage_account.name
}

output "application_insights_key" {
  description = "The Instrumentation Key for Application Insights"
  value       = module.application_insights.instrumentation_key
  sensitive = true
}

output "resource_group_name" {
  description = "rg name"
  value       = var.resource_group_name
}
