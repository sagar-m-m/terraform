variable "name" {
  description = "The name of the CosmosDB account"
  type        = string
}

variable "env" {
  description = "The environment (e.g., prd, dev, qa)"
  type        = string
}

variable "instance" {
  description = "The instance identifier"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group in which the CosmosDB account will be created"
  type        = string
}

variable "location" {
  description = "The Azure region in which to create the resources"
  type        = string
}

variable "offer_type" {
  description = "The offer type to use for the CosmosDB account"
  type        = string
  default     = "Standard"
}

variable "kind" {
  description = "The kind of CosmosDB to create"
  type        = string
  default     = "GlobalDocumentDB"
}
