variable "name" {
  description = "The name for the Linux Function App."
  type        = string
}

variable "env" {
  description = "The environment for the Linux Function App."
  type        = string
}

variable "location_shorthand" {
  description = "Shorthand for the Azure location."
  type        = string
}

variable "instance" {
  description = "Instance name for the Linux Function App."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the Azure resource group."
  type        = string
}

variable "location" {
  description = "Azure location where the Linux Function App should be created."
  type        = string
}

variable "storage_account_name" {
  description = "Name of the storage account."
  type        = string
}

variable "storage_account_primary_access_key" {
  description = "Primary access key for the storage account."
  type        = string
  sensitive   = true
}

variable "service_plan_id" {
  description = "ID of the service plan."
  type        = string
}

variable "application_insights_key" {
  description = "Key for Application Insights."
  type        = string
  sensitive   = true
}

variable "identity_ids" {
  description = "List of User Assigned Managed Identity IDs."
  type        = list(string)
}
