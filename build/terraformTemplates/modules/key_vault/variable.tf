variable "name" {
  description = "Name to be used on all the resources as identifier"
  type        = string
}

variable "env" {
  description = "The environment for the deployment"
  type        = string
}

variable "location_shorthand" {
  description = "Shorthand for the location of the resources"
  type        = string
}

variable "instance" {
  description = "Instance name"
  type        = string
}

variable "location" {
  description = "The Azure Region in which all resources in this example should be created."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group in which to create the resources."
  type        = string
}

variable "sku_name" {
  description = "Defines the SKU of Key Vault."
  default     = "standard"
  type        = string
}
