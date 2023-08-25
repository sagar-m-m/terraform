variable "ssl_cert_kv_name" {
  description = "Name of the Key Vault that contains the SSL certificate"
  type        = string
}

variable "ssl_cert_kv_resource_group_name" {
  description = "Name of the resource group in which the Key Vault is located"
  type        = string
}

variable "ssl_cert_name" {
  description = "Name of the SSL certificate"
  type        = string
}

variable "api_management_id" {
  description = "ID of the API Management service"
  type        = string
}

variable "gateway_hostname" {
  description = "The hostname of the gateway"
  type        = string
}
