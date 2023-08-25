variable "key_permissions" {
  description = "List of key permissions to be assigned"
  type        = list(string)
  default     = []
}

variable "secret_permissions" {
  description = "List of secret permissions to be assigned"
  type        = list(string)
  default     = []
}

variable "key_vault_id" {
  description = "Keyvault id to apply policies to"
  type        = string

}


variable "certificate_permissions" {
  description = "List of certificate permissions to be assigned"
  type        = list(string)
  default     = []
}

variable "storage_permissions" {
  description = "List of storage permissions to be assigned"
  type        = list(string)
  default     = []
}

variable "object_id" {
  type = string
  
}
