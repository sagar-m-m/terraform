variable "hostname" {
  description = "The hostname for the App Service custom hostname binding"
  type        = string
}

variable "app_service_name" {
  description = "The name of the App Service where to create the custom hostname binding"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group where the App Service is located"
  type        = string
}
