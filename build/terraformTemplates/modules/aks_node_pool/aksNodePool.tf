resource "azurerm_kubernetes_cluster_node_pool" "aksnp" {
  name                  = "aksnp${var.env}${var.instance}"
  mode                  = var.mode
  os_type               = var.os_type
  orchestrator_version  = var.orchestrator_version
  vm_size               = var.vm_size
  priority              = var.priority
  eviction_policy       = var.priority == "Spot" ? var.eviction_policy : null
  spot_max_price        = var.priority == "Spot" ? var.spot_max_price : -1
  kubernetes_cluster_id = var.kubernetes_cluster_id
  enable_auto_scaling   = var.enable_auto_scaling
  enable_node_public_ip = var.enable_node_public_ip
  max_count             = var.max_count
  min_count             = var.min_count
  node_labels           = var.node_labels
  node_taints           = var.node_taints
  ultra_ssd_enabled     = var.ultra_ssd_enabled
  zones                 = var.zones

  tags = {
    env         = var.env
    
  }

  lifecycle {
    ignore_changes = [tags]
  }

}