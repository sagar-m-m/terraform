variable "name" {
  description = "The name of the Log Analytics Workspace"
  type        = string
}

variable "env" {
  description = "The environment for the Log Analytics Workspace (e.g., dev, prod)"
  type        = string
}

variable "location_shorthand" {
  description = "The shorthand for the Azure region where the Log Analytics Workspace will be deployed"
  type        = string
}

variable "instance" {
  description = "The instance identifier for the Log Analytics Workspace"
  type        = string
}

variable "location" {
  description = "The Azure location where the Log Analytics Workspace will be deployed"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group in which to create the Log Analytics Workspace"
  type        = string
}

variable "sku" {
  description = "The SKU of the Log Analytics Workspace"
  type        = string
  default     = "PerGB2018"
}

variable "retention_in_days" {
  description = "The retention period for the Log Analytics Workspace in days"
  type        = number
  default     = 30
}