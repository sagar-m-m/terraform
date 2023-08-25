variable "name" {
  description = "The name of the static site"
  type        = string
}

variable "env" {
  description = "The environment the resources will be part of"
  type        = string
}

variable "location_shorthand" {
  description = "The location shorthand of where the resources will be created"
  type        = string
}

variable "instance" {
  description = "Instance details for the resource"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group in which to create the static site"
  type        = string
}

variable "location" {
  description = "The location/region in which to create the static site"
  type        = string
}

variable "sku_tier" {
  description = "The SKU Tier of the static site"
  type        = string
}
