variable "active_directory_group_name" {
  description = "The name of the Active Directory group"
  type        = string
}

variable "scope" {
  description = "The scope in which the role assignment is applied to"
  type        = string
}

variable "role_definition_name" {
  description = "The role definition name to be assigned"
  type        = string
}
