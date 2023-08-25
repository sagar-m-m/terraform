variable "public_ip_name" {
  description = "The name for the Azure public IP."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the Azure resource group."
  type        = string
}

variable "location" {
  description = "Azure location where the public IP should be created."
  type        = string
}
