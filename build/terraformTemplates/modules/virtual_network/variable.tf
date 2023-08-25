variable "name" {
  description = "A base name used for resources."
  type        = string
}

variable "env" {
  description = "The environment, e.g., prod, dev, staging."
  type        = string
}

variable "location_shorthand" {
  description = "Shorthand for the Azure location."
  type        = string
}

variable "instance" {
  description = "An instance identifier for the resource."
  type        = string
}

variable "address_space" {
  description = "The address space for the virtual network."
  type        = list(string)
}

variable "location" {
  description = "The Azure location where the virtual network is deployed."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the Azure resource group."
  type        = string
}
