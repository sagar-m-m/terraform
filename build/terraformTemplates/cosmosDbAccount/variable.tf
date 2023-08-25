variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "location" {
  description = "Azure region to deploy the resources"
  type        = string
}

variable "env" {
  description = "Environment (e.g., dev, qa, prd)"
  type        = string
}

variable "rg_instance" {
  description = "Instance identifier for the resource group"
  type        = string
}

variable "cosmosdb_account_name" {
  description = "Name of the CosmosDB account"
  type        = string
}

variable "instance" {
  description = "Instance identifier for the CosmosDB account"
  type        = string
}

variable "kind" {
  description = "Kind of the CosmosDB account"
  type        = string
  default     = "GlobalDocumentDB"
}

variable "offer_type" {
  description = "Offer type for the CosmosDB account"
  type        = string
  default     = "Standard"
}

variable "location_map" {
  description = "Mapping of location full names to shorthand"
  type        = map(string)
  default = {
    "westeurope" = "weu"
    "eastus"     = "eu"
    "westus"     = "wu"
    "westus2"    = "wu2"

  }
}

