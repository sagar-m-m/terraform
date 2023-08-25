data "azurerm_log_analytics_workspace" "laws" {
  name                = var.laws_name
  resource_group_name = var.laws_resource_group_name

}

module "resource_group" {
  source             = "../modules/resource_group"
  name               = var.resource_group_name
  location           = var.location
  env                = var.env
  location_shorthand = var.location_map[var.location]
  rg_instance        = var.rg_instance

}



module "aks_cluster" {
  source                                  = "../modules/aks_cluster"
  resource_group_name                     = module.resource_group.name
  location                                = module.resource_group.location
  env                                     = var.env
  instance                                = var.instance
  name                                    = var.aks_cluster_name
  dns_prefix                              = var.dns_prefix
  default_node_pool_name                  = var.default_node_pool_name
  default_node_pool_max_count             = var.default_node_pool_max_count
  default_node_pool_min_count             = var.default_node_pool_min_count
  default_node_pool_vm_size               = var.default_node_pool_vm_size
  default_node_pool_os_disk_size_gb       = var.default_node_pool_os_disk_size_gb
  default_node_pool_labels                = var.default_node_pool_labels
  default_node_pool_ultra_ssd_enabled     = var.default_node_pool_ultra_ssd_enabled
  log_analytics_workspace_id              = data.azurerm_log_analytics_workspace.laws.id
  node_resource_group_name                = var.node_resource_group_name
  default_node_pool_enable_auto_scaling   = var.default_node_pool_enable_auto_scaling
  keda_enabled                            = var.keda_enabled
  node_resource_group_instance            = var.node_resource_group_instance
  rbac_enabled                            = var.rbac_enabled
  secret_rotation_enabled                 = var.secret_rotation_enabled
  kubernetes_version                      = var.kubernetes_version
  location_shorthand                      = var.location_map[var.location]
  ingress_gateway_name                    = var.ingress_gateway_name
  network_plugin                          = var.network_plugin
  ingress_application_gateway_subnet_cidr = var.ingress_application_gateway_subnet_cidr
  sku_tier                                = var.aks_cluster_sku_tier



  depends_on = [
  data.azurerm_log_analytics_workspace.laws, module.resource_group]

}

module "aks_nodepool_dev" {
  source                = "../modules/aks_node_pool"
  env                   = "dev"
  enable_auto_scaling   = true
  enable_node_public_ip = false
  instance              = "01"
  kubernetes_cluster_id = module.aks_cluster.kubernetes_cluster_id
  eviction_policy       = "Delete"
  min_count             = 1
  max_count             = 2
  mode                  = "User"
  orchestrator_version  = "1.26.3"
  ultra_ssd_enabled     = false
  os_type               = "Linux"
  priority              = "Spot"
  spot_max_price        = "0.0206"
  vm_size               = "Standard_D2ads_V5"
  node_labels = {
    "env"         = "dev"
    "cost-center" = "dev"
    "unit"        = "eng"

  }
  node_taints = []
  zones       = []
  depends_on  = [module.aks_cluster, module.resource_group]

}

module "aks_nodepool_qa" {
  source                = "../modules/aks_node_pool"
  env                   = "qa"
  enable_auto_scaling   = true
  enable_node_public_ip = false
  instance              = "01"
  kubernetes_cluster_id = module.aks_cluster.kubernetes_cluster_id
  eviction_policy       = "Delete"
  min_count             = 1
  max_count             = 2
  mode                  = "User"
  orchestrator_version  = "1.26.3"
  ultra_ssd_enabled     = false
  os_type               = "Linux"
  priority              = "Spot"
  spot_max_price        = "0.0206"
  vm_size               = "Standard_D2ads_V5"
  node_labels = {
    "env"         = "qa"
    "cost-center" = "qa"
    "unit"        = "eng"

  }
  node_taints = []
  zones       = []
  depends_on  = [module.aks_cluster, module.resource_group]

}

module "aks_nodepool_prd" {
  source                = "../modules/aks_node_pool"
  env                   = "prd"
  enable_auto_scaling   = true
  enable_node_public_ip = false
  instance              = "01"
  kubernetes_cluster_id = module.aks_cluster.kubernetes_cluster_id
  eviction_policy       = "Delete"
  min_count             = 1
  max_count             = 2
  mode                  = "User"
  orchestrator_version  = "1.26.3"
  ultra_ssd_enabled     = false
  os_type               = "Linux"
  priority              = "Spot"
  spot_max_price        = "0.0515"
  vm_size               = "Standard_D2ads_V5"
  node_labels = {
    "env"         = "prd"
    "cost-center" = "prd"
    "unit"        = "eng"

  }
  node_taints = []
  zones       = []
  depends_on  = [module.aks_cluster, module.resource_group]

}
