module "resource_group" {
  source              = "../modules/resource_group"
  name = var.resource_group_name
  location            = var.location
  env                 = var.env
  location_shorthand  = var.location_map[var.location]
  rg_instance         = var.rg_instance


}

module "cosmosdb_account" {
  source = "../modules/cosmosdb_account"
  name = var.cosmosdb_account_name
  env = var.env
  instance = var.instance
  kind = var.kind
  location = module.resource_group.location
  offer_type = var.offer_type
  resource_group_name = module.resource_group.name
  depends_on = [ module.resource_group ]
  
}