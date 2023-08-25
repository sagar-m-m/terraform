variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "location" {
  description = "Azure region/location for the resource group"
  type        = string
}

variable "env" {
  description = "Environment (e.g., prod, dev, staging)"
  type        = string
}

variable "rg_instance" {
  description = "Instance of the resource group"
  type        = string
}

variable "dbws_sku" {
  description = "SKU for the Databricks workspace"
  type        = string
}

variable "instance" {
  description = "Instance identifier for the resources"
  type        = string
}

variable "virtual_network_name" {
  description = "Name of the virtual network"
  type        = string
}

variable "virtual_network_address_space" {
  description = "Address space for the virtual network"
  type        = string
}

variable "public_subnet_address_prefixes" {
  description = "Address prefixes for the public subnet"
  type        = string
}

variable "public_subnet_name" {
  description = "Name of the public subnet"
  type        = string
}

variable "delegation_actions" {
  description = "List of actions for service delegation"
  type        = list(string)
  default     = ["Microsoft.Network/virtualNetworks/subnets/join/action","Microsoft.Network/virtualNetworks/subnets/prepareNetworkPolicies/action","Microsoft.Network/virtualNetworks/subnets/unprepareNetworkPolicies/action"]
}

variable "enable_delegation" {
  description = "Enable or disable delegation"
  type        = bool
  default     = false
}

variable "service_delegation_name" {
  description = "Name of the service for delegation"
  type        = string
}

variable "private_subnet_address_prefixes" {
  description = "Address prefixes for the private subnet"
  type        = string
}

variable "private_subnet_name" {
  description = "Name of the private subnet"
  type        = string
}

variable "delegation_name" {
  description = "Name of the delegation for subnet-specific services or actions"
  type        = string
}

variable "network_security_group_name" {
  description = "Name of the network security group to be associated with the subnet"
  type        = string
}

variable "location_map" {
  description = "A mapping between Azure region names and their respective shorthand codes"
  type        = map(string)
  default     = {
    "westeurope" = "weu"
    "eastus"     = "eu"
    "westus"     = "wu"
    "westus2"    = "wu2"
  }
}
