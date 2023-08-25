resource "azurerm_kubernetes_cluster" "aks" {
  name                              = "aks-${var.name}-${var.env}-${var.location_shorthand}-${var.instance}"
  location                          = var.location
  resource_group_name               = var.resource_group_name
  dns_prefix                        = var.dns_prefix
  role_based_access_control_enabled = var.rbac_enabled
  kubernetes_version                = var.kubernetes_version
  node_resource_group               = "rg-${var.node_resource_group_name}-${var.env}-${var.location_shorthand}-${var.node_resource_group_instance}"
  sku_tier                          = var.sku_tier


  default_node_pool {
    name                        = "aksnp${var.default_node_pool_name}"
    enable_auto_scaling         = var.default_node_pool_enable_auto_scaling
    max_count                   = var.default_node_pool_max_count
    min_count                   = var.default_node_pool_min_count
    vm_size                     = var.default_node_pool_vm_size
    os_disk_size_gb             = var.default_node_pool_os_disk_size_gb
    node_labels                 = var.default_node_pool_labels
    ultra_ssd_enabled           = var.default_node_pool_ultra_ssd_enabled
    temporary_name_for_rotation = "aksnptemp"
  }


  identity {
    type = "SystemAssigned"
  }

  network_profile {
    load_balancer_sku = "standard"
    network_plugin    = var.network_plugin
  }
  ingress_application_gateway {

    gateway_name = "agw-${var.ingress_gateway_name}-${var.env}-${var.location_shorthand}-${var.instance}"
    subnet_cidr  = var.ingress_application_gateway_subnet_cidr


  }

  oms_agent {
    log_analytics_workspace_id = var.log_analytics_workspace_id
  }

  key_vault_secrets_provider {
    secret_rotation_enabled = var.secret_rotation_enabled
  }

  workload_autoscaler_profile {
    keda_enabled = var.keda_enabled
  }



  tags = {
    env         = var.env
    
  }

  lifecycle {
    ignore_changes = [tags]
  }
}
