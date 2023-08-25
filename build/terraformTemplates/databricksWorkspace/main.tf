module "resource_group" {
  source             = "../modules/resource_group"
  name               = var.resource_group_name
  location           = var.location
  env                = var.env
  location_shorthand = var.location_map[var.location]
  rg_instance        = var.rg_instance

}

module "databricks" {
  source                                               = "../modules/databricks_workspace"
  resource_group_name                                  = module.resource_group.name
  location                                             = module.resource_group.location
  sku                                                  = var.dbws_sku
  env                                                  = var.env
  instance                                             = var.instance
  location_shorthand                                   = var.location_map[var.location]
  private_subnet_name                                  = module.private_subnet.name
  public_subnet_name                                   = module.public_subnet.name
  storage_account_name                                 = "sadbwstorage${var.env}${var.location_map[var.location]}${var.instance}"
  virtual_network_name                                 = module.vnet.name
  virtual_network_id                                   = module.vnet.id
  private_subnet_network_security_group_association_id = module.nsg.id
  public_subnet_network_security_group_association_id  = module.nsg.id
  depends_on                                           = [module.resource_group, module.vnet, module.private_subnet, module.public_subnet]

}

module "vnet" {
  source              = "../modules/virtual_network"
  name                = var.virtual_network_name
  address_space       = var.virtual_network_address_space
  location            = module.resource_group.location
  env                 = var.env
  location_shorthand  = var.location_map[var.location]
  resource_group_name = module.resource_group.name
  instance            = var.instance
  depends_on          = [module.resource_group]

}

module "public_subnet" {
  source                  = "../modules/subnet"
  name                    = var.public_subnet_name
  address_prefixes        = var.public_subnet_address_prefixes
  resource_group_name     = module.resource_group.name
  instance                = var.instance
  location                = module.resource_group.location
  location_shorthand      = var.location_map[var.location]
  env                     = var.env
  depends_on              = [module.resource_group, module.vnet]
  delegation_actions      = var.delegation_actions
  delegation_name         = var.delegation_name
  enable_delegation       = var.enable_delegation
  service_delegation_name = var.service_delegation_name
  virtual_network_name    = module.vnet.name


}

module "private_subnet" {
  source                  = "../modules/subnet"
  name                    = var.private_subnet_name
  instance                = var.instance
  location                = module.resource_group.location
  address_prefixes        = var.private_subnet_address_prefixes
  location_shorthand      = var.location_map[var.location]
  resource_group_name     = module.resource_group.name
  env                     = var.env
  delegation_actions      = var.delegation_actions
  delegation_name         = var.delegation_name
  enable_delegation       = var.enable_delegation
  service_delegation_name = var.service_delegation_name
  virtual_network_name    = module.vnet.name
  depends_on              = [module.resource_group, module.vnet]

}

module "nsg" {
  source              = "../modules/network_securitygroups"
  name                = var.network_security_group_name
  env                 = var.env
  instance            = var.instance
  location            = module.resource_group.location
  location_shorthand  = var.location_map[var.location]
  resource_group_name = module.resource_group.name
  depends_on          = [module.resource_group]

}

resource "azurerm_subnet_network_security_group_association" "nsg_associate_private" {

  network_security_group_id = module.nsg.id
  subnet_id                 = module.private_subnet.id
  depends_on                = [module.resource_group, module.nsg, module.private_subnet]

}

resource "azurerm_subnet_network_security_group_association" "nsg_associate_public" {

  network_security_group_id = module.nsg.id
  subnet_id                 = module.public_subnet.id
  depends_on                = [module.resource_group, module.nsg, module.public_subnet]

}
