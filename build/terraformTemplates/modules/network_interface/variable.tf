variable "network_interface_name" {
  type        = string
  description = "The name of the network interface."
}

variable "resource_group_name" {
  type        = string
  description = "The name of the resource group."
}

variable "location" {
  type        = string
  description = "The location of the network interface."
}
variable "ip_configuration_name" {
  type        = string
   default = "ipconfig1"
  description = "Name of the IP configuration"
}

variable "private_ip_address_allocation" {
  type        = string
  description = "Private IP address allocation method (Dynamic or Static)"
  default     = "Dynamic"
}
variable "subnet_id" {
  description = "ID of the subnet to attach the network interface to"
  type        = string
}
variable "network_security_group_id" {
  type = string
}

variable "public_ip_address_id" {
  type        = string
  default = "static"
}
