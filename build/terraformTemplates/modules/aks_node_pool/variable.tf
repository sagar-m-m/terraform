variable "env" {
  description = "The environment for the AKS node pool."
  type        = string
}

variable "instance" {
  description = "The instance for the AKS node pool."
  type        = string
}

variable "mode" {
  description = "The mode for the AKS node pool."
  type        = string
}

variable "os_type" {
  description = "The OS type for the AKS node pool."
  type        = string
}

variable "orchestrator_version" {
  description = "The orchestrator version for the AKS node pool."
  type        = string
}

variable "vm_size" {
  description = "The VM size for the AKS node pool."
  type        = string
}

variable "priority" {
  description = "The priority for the AKS node pool. Can be 'Spot' or 'Regular'."
  type        = string
}

variable "eviction_policy" {
  description = "The eviction policy for the AKS node pool."
  type        = string
  default     = null
}

variable "spot_max_price" {
  description = "The maximum price for spot instances."
  type        = number
  default     = -1
}

variable "kubernetes_cluster_id" {
  description = "The ID of the AKS cluster."
  type        = string
}

variable "enable_auto_scaling" {
  description = "Whether to enable auto scaling for the AKS node pool."
  type        = bool
}

variable "enable_node_public_ip" {
  description = "Whether to enable public IP for the AKS node pool."
  type        = bool
}

variable "max_count" {
  description = "The maximum number of nodes for the AKS node pool."
  type        = number
}

variable "min_count" {
  description = "The minimum number of nodes for the AKS node pool."
  type        = number
}

variable "node_labels" {
  description = "The labels for the AKS node pool."
  type        = map(string)
}

variable "node_taints" {
  description = "The taints for the AKS node pool."
  type        = list(string)
}

variable "ultra_ssd_enabled" {
  description = "Whether to enable ultra SSD for the AKS node pool."
  type        = bool
}

variable "zones" {
  description = "The availability zones for the AKS node pool."
  type        = list(string)
}
