variable "name" {
  description = "Base name for the Azure Subnet."
  type        = string
}

variable "env" {
  description = "The environment for the Azure Subnet."
  type        = string
}

variable "location_shorthand" {
  description = "Shorthand for the Azure location for naming the Azure Subnet."
  type        = string
}

variable "instance" {
  description = "Instance name for the Azure Subnet."
  type        = string
}

variable "address_prefixes" {
  description = "The address prefixes to use for the subnet."
  type        = list(string)
}

variable "resource_group_name" {
  description = "The name of the Azure resource group."
  type        = string
}

variable "virtual_network_name" {
  description = "The name of the Azure virtual network."
  type        = string
}

variable "enable_delegation" {
  description = "Boolean to enable or disable subnet delegation."
  type        = bool
}

variable "delegation_name" {
  description = "The name of the delegation."
  type        = string
  default     = ""
}

variable "service_delegation_name" {
  description = "The name of the service delegation."
  type        = string
  default     = ""
}

variable "delegation_actions" {
  type = list(string)
  default = ["Microsoft.Network/virtualNetworks/subnets/join/action",
    "Microsoft.Network/virtualNetworks/subnets/prepareNetworkPolicies/action",
  "Microsoft.Network/virtualNetworks/subnets/unprepareNetworkPolicies/action"]

}