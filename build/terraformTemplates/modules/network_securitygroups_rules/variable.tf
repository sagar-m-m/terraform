variable "name" {
  description = "The name of the security rule"
  type        = string
}

variable "priority" {
  description = "The priority of the security rule"
  type        = number
}

variable "direction" {
  description = "The direction of the security rule"
  type        = string
}

variable "access" {
  description = "The access policy of the security rule"
  type        = string
}

variable "protocol" {
  description = "The protocol of the security rule"
  type        = string
}

variable "source_port_range" {
  description = "The source port range of the security rule"
  type        = string
}

variable "destination_port_range" {
  description = "The destination port range of the security rule"
  type        = string
}

variable "source_address_prefix" {
  description = "The source address prefix of the security rule"
  type        = string
}

variable "destination_address_prefix" {
  description = "The destination address prefix of the security rule"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "network_security_group_name" {
  description = "The name of the network security group"
  type        = string
}
