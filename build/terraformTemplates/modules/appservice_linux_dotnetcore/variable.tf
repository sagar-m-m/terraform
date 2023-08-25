variable "name" {
  description = "Name of the app service"
  type        = string
}

variable "env" {
  description = "Environment of the resource"
  type        = string
}

variable "location_shorthand" {
  description = "Shorthand for the location of the resource"
  type        = string
}

variable "instance" {
  description = "Instance of the resource"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "location" {
  description = "Location of the resource"
  type        = string
}

variable "service_plan_id" {
  description = "ID of the app service plan"
  type        = string
}

variable "application_insights_key" {
  description = "Instrumentation key for Application Insights"
  type        = string
}

variable "dotnet_version" {
  type = string

}
