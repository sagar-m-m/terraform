variable "name" {
  description = "The name to be used in resources"
  type        = string
}

variable "env" {
  description = "The environment where the resources are deployed"
  type        = string
}

variable "location_shorthand" {
  description = "The shorthand for the location"
  type        = string
}

variable "location" {
  description = "The Azure region where the resources are deployed"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group where resources are deployed"
  type        = string
}

variable "publisher_name" {
  description = "The name of the publisher"
  type        = string
}

variable "publisher_email" {
  description = "The email of the publisher"
  type        = string
}

variable "sku_name" {
  description = "The SKU name of the API Management service"
  type        = string
}

variable "instance" {
  description = "The instance name of the service"
  type        = string
}
