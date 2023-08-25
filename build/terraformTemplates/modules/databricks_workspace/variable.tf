variable "env" {
  description = "The environment for the Databricks workspace."
  type        = string
}

variable "location_shorthand" {
  description = "Shorthand for the Azure location."
  type        = string
}

variable "instance" {
  description = "Instance name for the Databricks workspace."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the Azure resource group."
  type        = string
}

variable "location" {
  description = "Azure location where the Databricks workspace should be created."
  type        = string
}

variable "sku" {
  description = "SKU for the Databricks workspace."
  type        = string
}

variable "private_subnet_name" {
  description = "Name of the private subnet."
  type        = string
}

variable "public_subnet_name" {
  description = "Name of the public subnet."
  type        = string
}

variable "virtual_network_id" {
  description = "ID of the virtual network."
  type        = string
}

variable "storage_account_name" {
  description = "Name of the storage account."
  type        = string
}

variable "public_subnet_network_security_group_association_id" {
  description = "Network security group association ID for the public subnet."
  type        = string
}

variable "private_subnet_network_security_group_association_id" {
  description = "Network security group association ID for the private subnet."
  type        = string
}
