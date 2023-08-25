variable "name" {
  description = "The name for the app configuration"
  type        = string
}

variable "env" {
  description = "The environment for the deployment"
  type        = string
}

variable "instance" {
  description = "Instance name"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group in which to create the resources."
  type        = string
}

variable "location" {
  description = "The Azure Region in which all resources in this example should be created."
  type        = string
}

variable "sku_name" {
  description = "Defines the SKU of App Configuration."
  type        = string
}
