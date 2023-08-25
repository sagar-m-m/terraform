variable "name" {
  description = "The name for the Power BI resource"
  type        = string
}

variable "env" {
  description = "The environment tag (e.g., dev, prod)"
  type        = string
}

variable "instance" {
  description = "The instance number or identifier"
  type        = string
}

variable "location" {
  description = "The Azure location where the resource will be created"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group in which to create the Power BI resource"
  type        = string
}

variable "sku_name" {
  description = "The name of the SKU to use for the Power BI resource"
  type        = string
}

variable "admin_members_email" {
  description = "The email of the administrator for the Power BI resource"
  type        = list(string)
}
