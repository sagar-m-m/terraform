variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "location" {
  description = "The location of the resource group"
  type        = string
}

variable "env" {
  description = "The environment of the resource group"
  type        = string
}

variable "function_app_name" {
  description = "The name of the function app"
  type        = string


}

variable "storage_account_tier" {
  description = "The tier of the storage account"
  type        = string
}

variable "storage_account_replication_type" {
  description = "The replication type of the storage account"
  type        = string
}

variable "asp_name" {
  description = "The name of the app service plan"
  type        = string
}

variable "asp_resource_group_name" {
  description = "The rg name of the app service plan"
  type        = string
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

variable "instance" {
  description = "The instance of the application insights"
  type        = string
}

variable "laws_name" {
  description = "The workspace name of the log analytics"
  type        = string
}

variable "laws_resource_group_name" {
  type = string

}

variable "managed_identity_name" {
  type = string

}
variable "managed_identity_resource_group_name" {

  type = string

}


