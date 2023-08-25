variable "name" {
  description = "The name for the App Service Plan."
  type        = string
}

variable "env" {
  description = "The environment for the App Service Plan."
  type        = string
}

variable "location_shorthand" {
  description = "Shorthand for the Azure location."
  type        = string
}

variable "instance" {
  description = "Instance name for the App Service Plan."
  type        = string
}

variable "location" {
  description = "Azure location where the App Service Plan should be created."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the Azure resource group."
  type        = string
}

variable "sku_name" {
  description = "SKU name for the App Service Plan."
  type        = string
}
