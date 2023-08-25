variable "name" {
  description = "Base name for the Azure SQL Elastic Pool."
  type        = string
}

variable "env" {
  description = "The environment for the Azure SQL Elastic Pool."
  type        = string
}

variable "instance" {
  description = "Instance name for the Azure SQL Elastic Pool."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the Azure resource group."
  type        = string
}

variable "location" {
  description = "Azure location where the SQL Elastic Pool should be created."
  type        = string
}

variable "server_name" {
  description = "The name of the Azure SQL Server."
  type        = string
}
