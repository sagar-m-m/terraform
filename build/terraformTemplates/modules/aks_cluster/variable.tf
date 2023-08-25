variable "name" {
  description = "The name of the AKS cluster."
  type        = string
}

variable "env" {
  description = "Environment for the AKS cluster."
  type        = string
}

variable "location_shorthand" {
  description = "Shorthand for the Azure location."
  type        = string
}

variable "instance" {
  description = "Instance name for the AKS cluster."
  type        = string
}

variable "location" {
  description = "Azure location where the AKS cluster should be created."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the Azure resource group."
  type        = string
}

variable "dns_prefix" {
  description = "DNS prefix for the AKS cluster."
  type        = string
}

variable "rbac_enabled" {
  description = "Boolean flag to enable RBAC."
  type        = bool
}

variable "kubernetes_version" {
  description = "Version of Kubernetes to use for the AKS cluster."
  type        = string
}

variable "node_resource_group_name" {
  description = "The name of the node resource group for the AKS cluster."
  type        = string
}

variable "node_resource_group_instance" {
  description = "Instance name for the node resource group."
  type        = string
}

variable "sku_tier" {
  description = "SKU tier for the AKS cluster."
  type        = string
}

variable "default_node_pool_name" {
  description = "Name for the default node pool."
  type        = string
}

variable "default_node_pool_enable_auto_scaling" {
  description = "Enable auto scaling for the default node pool."
  type        = bool
}

variable "default_node_pool_max_count" {
  description = "Max count for the default node pool."
  type        = number
}

variable "default_node_pool_min_count" {
  description = "Min count for the default node pool."
  type        = number
}

variable "default_node_pool_vm_size" {
  description = "VM size for the default node pool."
  type        = string
}

variable "default_node_pool_os_disk_size_gb" {
  description = "OS disk size in GB for the default node pool."
  type        = number
}

variable "default_node_pool_labels" {
  description = "Node labels for the default node pool."
  type        = map(string)
}

variable "default_node_pool_ultra_ssd_enabled" {
  description = "Enable ultra SSD for the default node pool."
  type        = bool
}

variable "network_plugin" {
  description = "Network plugin for the AKS cluster."
  type        = string
}

variable "ingress_gateway_name" {
  description = "Name for the ingress application gateway."
  type        = string
}

variable "ingress_application_gateway_subnet_cidr" {
  description = "CIDR for the ingress application gateway subnet."
  type        = string
}

variable "log_analytics_workspace_id" {
  description = "ID of the Log Analytics workspace."
  type        = string
}

variable "secret_rotation_enabled" {
  description = "Enable secret rotation for the key vault secrets provider."
  type        = bool
}

variable "keda_enabled" {
  description = "Enable KEDA for the workload autoscaler profile."
  type        = bool
}
