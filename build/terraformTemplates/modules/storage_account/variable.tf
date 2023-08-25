variable "source_type" {
  description = "Source type for the Azure Storage Account name."
  type        = string
}

variable "name" {
  description = "Base name for the Azure Storage Account."
  type        = string
}

variable "env" {
  description = "The environment for the Azure Storage Account."
  type        = string
}

variable "instance" {
  description = "Instance name for the Azure Storage Account."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the Azure resource group."
  type        = string
}

variable "location" {
  description = "Azure location where the Storage Account should be created."
  type        = string
}

variable "account_tier" {
  description = "Defines the Tier to use for this storage account. Valid options are Standard and Premium."
  type        = string
}

variable "account_replication_type" {
  description = "Defines the type of replication to use for this storage account. Valid options include LRS, GRS, RAGRS, and ZRS."
  type        = string
}
