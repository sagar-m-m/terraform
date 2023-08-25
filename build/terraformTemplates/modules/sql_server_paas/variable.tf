variable "name" {
  description = "Base name for the Azure SQL Server."
  type        = string
}

variable "env" {
  description = "The environment for the Azure SQL Server."
  type        = string
}

variable "instance" {
  description = "Instance name for the Azure SQL Server."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the Azure resource group."
  type        = string
}

variable "location" {
  description = "Azure location where the SQL Server should be created."
  type        = string
}

variable "admin_username" {
  description = "Administrator login name for the Azure SQL Server."
  type        = string
}

variable "admin_password" {
  description = "Administrator login password for the Azure SQL Server."
  type        = string
  sensitive   = true
}

variable "azuread_admin_username" {
  description = "Azure AD administrator login name for the Azure SQL Server."
  type        = string
}

variable "azuread_admin_object_id" {
  description = "Azure AD administrator object ID for the Azure SQL Server."
  type        = string
}
