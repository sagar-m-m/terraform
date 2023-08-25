variable "env" {
  description = "The environment for the AKS node pool."
}

variable "instance" {
  description = "The instance number for the AKS node pool."
}

variable "aks_cluster_name" {
  description = "The name of the AKS cluster."
}

variable "dns_prefix" {
  description = "The DNS prefix for the AKS cluster."
}

variable "default_node_pool_name" {
  description = "The name for the AKS cluster's default node pool."
}

variable "default_node_pool_max_count" {
  description = "The maximum node count for the AKS cluster's default node pool."
}

variable "default_node_pool_min_count" {
  description = "The minimum node count for the AKS cluster's default node pool."
}

variable "default_node_pool_vm_size" {
  description = "The VM size for the AKS cluster's default node pool."
}

variable "default_node_pool_os_disk_size_gb" {
  description = "The OS disk size in GB for the AKS cluster's default node pool."
}

variable "default_node_pool_labels" {
  description = "The labels for the AKS cluster's default node pool."
  type        = map(string)
}

variable "default_node_pool_ultra_ssd_enabled" {
  description = "The flag indicating whether ultra SSD is enabled for the AKS cluster's default node pool."
}

variable "node_resource_group_name" {
  description = "The name of the node resource group."
}

variable "default_node_pool_enable_auto_scaling" {
  description = "The flag indicating whether auto scaling is enabled for the AKS cluster's default node pool."
}

variable "keda_enabled" {
  description = "The flag indicating whether KEDA is enabled for the AKS cluster."
}

variable "node_resource_group_instance" {
  description = "The instance number of the node resource group."
}

variable "rbac_enabled" {
  description = "The flag indicating whether RBAC is enabled for the AKS cluster."
}

variable "secret_rotation_enabled" {
  description = "The flag indicating whether secret rotation is enabled for the AKS cluster."
}

variable "kubernetes_version" {
  description = "The version of Kubernetes for the AKS cluster."
}

variable "laws_name" {
  description = "The name of the Log Analytics workspace."
}

variable "laws_resource_group_name" {
  description = "The name of the resource group for the Log Analytics workspace."
}

variable "resource_group_name" {
  description = "The name of the resource group."
}

variable "location" {
  description = "The location of the resource group."
}

variable "rg_instance" {
  description = "The instance number of the resource group."
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
variable "ingress_gateway_name" {
  description = "ingress gateway name"
  type        = string
}

variable "network_plugin" {
  description = "Network plugin type"
  type        = string
}

variable "ingress_application_gateway_subnet_cidr" {
  description = "Network plugin type"
  type        = string
}


variable "aks_cluster_sku_tier" {
  description = "TIer of aks cluster"
  type        = string
}



