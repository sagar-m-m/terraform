variable "username_secret_name" {
  description = "The name of the secret containing the username in the Azure Key Vault."
  type        = string
}

variable "password_secret_name" {
  description = "The name of the secret containing the password in the Azure Key Vault."
  type        = string
}

variable "key_vault_id" {
  description = "The ID of the Azure Key Vault."
  type        = string
}

variable "virtual_machine_name" {
  description = "The name of the Azure virtual machine."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the Azure resource group."
  type        = string
}

variable "network_interface_id" {
  description = "The ID of the Azure network interface associated with the virtual machine."
  type        = string
}

variable "location" {
  description = "The Azure location where the virtual machine is deployed."
  type        = string
}

variable "vm_size" {
  description = "The size of the Azure virtual machine."
  type        = string
}

variable "managed_disk_type" {
  description = "The type of managed disk to use for the OS disk."
  type        = string
  default     = "Premium_LRS"
}
