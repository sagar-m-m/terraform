data "azurerm_key_vault" "kv" {
  name                = var.kv_name
  resource_group_name = var.kv_resource_group_name
}

data "azurerm_key_vault_secret" "vm_password" {
  name         = var.kv_secret_vm_password_name
  key_vault_id = data.azurerm_key_vault.kv.id
  depends_on   = [data.azurerm_key_vault.kv]

}

data "azurerm_key_vault_secret" "sqlServer_password" {
  name         = var.kv_secret_sqlServer_password_name
  key_vault_id = data.azurerm_key_vault.kv.id
  depends_on   = [data.azurerm_key_vault.kv]
}

module "resource_group" {
  source             = "../modules/resource_group"
  name               = var.resource_group_name
  location_shorthand = var.location_map[var.location]
  location           = var.location
  rg_instance        = var.rg_instance
  env                = var.env
}

module "data_disk_sqlData" {

  source                        = "../modules/managed_disk"
  name                          = "data-${module.virtual_machine.name}"
  create_option                 = "Empty"
  env                           = var.env
  public_network_access_enabled = false
  resource_group_name           = module.resource_group.name
  location                      = module.resource_group.location
  storage_account_type          = var.data_disk_sqlData_storage_account_type
  disk_size_gb                  = var.data_disk_sqlData_disk_size_gb
  depends_on                    = [module.resource_group, module.virtual_machine]

}

module "data_disk_sqlData_attach" {
  source                    = "../modules/managed_disk_attachment"
  managed_disk_id           = module.data_disk_sqlData.id
  lun                       = 3
  virtual_machine_id        = module.virtual_machine.id
  write_accelerator_enabled = false
  caching                   = var.caching
  depends_on                = [module.resource_group, module.data_disk_sqlData, module.virtual_machine]

}

module "data_disk_sqlTempDb" {

  source                        = "../modules/managed_disk"
  name                          = "tempDb-${module.virtual_machine.name}"
  create_option                 = "Empty"
  env                           = var.env
  public_network_access_enabled = false
  resource_group_name           = module.resource_group.name
  location                      = module.resource_group.location
  storage_account_type          = var.data_disk_sqlTempDb_storage_account_type
  disk_size_gb                  = var.data_disk_sqlTempDb_disk_size_gb
  depends_on                    = [module.resource_group, module.virtual_machine]

}

module "data_disk_sqlTempDb_attach" {
  source                    = "../modules/managed_disk_attachment"
  managed_disk_id           = module.data_disk_sqlTempDb.id
  lun                       = 4
  virtual_machine_id        = module.virtual_machine.id
  write_accelerator_enabled = false
  caching                   = var.caching
  depends_on                = [module.resource_group, module.data_disk_sqlTempDb, module.virtual_machine]

}



module "data_disk_sqlLog" {

  source                        = "../modules/managed_disk"
  name                          = "log-${module.virtual_machine.name}"
  create_option                 = "Empty"
  env                           = var.env
  public_network_access_enabled = false
  resource_group_name           = module.resource_group.name
  location                      = module.resource_group.location
  storage_account_type          = var.data_disk_sqlLog_storage_account_type
  disk_size_gb                  = var.data_disk_sqlLog_disk_size_gb
  depends_on                    = [module.resource_group, module.virtual_machine]

}

module "data_disk_sqlLog_attach" {
  source                    = "../modules/managed_disk_attachment"
  managed_disk_id           = module.data_disk_sqlLog.id
  lun                       = 2
  virtual_machine_id        = module.virtual_machine.id
  write_accelerator_enabled = false
  caching                   = var.caching

  depends_on = [module.resource_group, module.data_disk_sqlLog, module.virtual_machine]

}

module "virtual_network" {
  source              = "../modules/virtual_network"
  name                = var.virtual_network_name
  address_space       = var.virtual_network_address_space
  resource_group_name = module.resource_group.name
  location_shorthand  = var.location_map[var.location]
  env                 = var.env
  instance            = var.instance
  location            = var.location

  depends_on = [
    module.resource_group
  ]
}

module "subnet" {
  source                  = "../modules/subnet"
  name                    = var.subnet_name
  address_prefixes        = var.subnet_address_prefix
  env                     = var.env
  resource_group_name     = module.resource_group.name
  location_shorthand      = var.location_map[var.location]
  virtual_network_name    = module.virtual_network.name
  instance                = var.instance
  location                = module.resource_group.location
  enable_delegation       = var.subnet_enable_delegation
  delegation_name         = var.subnet_delegation_name
  service_delegation_name = var.subnet_service_delegation_name
  delegation_actions      = var.subnet_delegation_actions


  depends_on = [module.resource_group, module.virtual_network]


}

module "network_securitygroup" {
  source              = "../modules/network_securitygroups"
  name                = var.network_securitygroup_name
  env                 = var.env
  instance            = var.instance
  location_shorthand  = var.location_map[var.location]
  resource_group_name = module.resource_group.name
  location            = module.resource_group.location
  depends_on          = [module.resource_group]
}


module "public_ip" {
  source              = "../modules/public_ip"
  resource_group_name = module.resource_group.name
  location            = module.resource_group.location
  name                = var.public_ip_name
  allocation_method   = var.public_ip_allocation_method
  location_shorthand  = var.location_map[var.location]
  env                 = var.env
  instance            = var.instance
  depends_on          = [module.resource_group]
}


module "network_interface" {
  source                             = "../modules/network_interface"
  name                               = "${var.network_interface_name}-${var.env}-${var.location_map[var.location]}-${var.instance}"
  ip_configuration_name              = var.ip_configuration_name
  resource_group_name                = module.resource_group.name
  location                           = module.resource_group.location
  subnet_id                          = module.subnet.id
  public_ip_address_id               = module.public_ip.id
  instance                           = var.instance
  private_ip_address_allocation_type = var.private_ip_address_allocation_type
  locationShorthand                  = var.location_map[var.location]
  env                                = var.env
  depends_on = [
    module.resource_group,
    module.virtual_network,
    module.network_securitygroup,
    module.public_ip
  ]
}

module "nsg_associate" {
  source                    = "../modules/nsg_nic_associate"
  network_interface_id      = module.network_interface.id
  network_security_group_id = module.network_securitygroup.id
  depends_on                = [module.resource_group, module.network_interface, module.network_securitygroup]

}


module "virtual_machine" {
  source                            = "../modules/virtual_machines_windows"
  name                              = var.virtual_machine_name
  resource_group_name               = module.resource_group.name
  location                          = module.resource_group.location
  network_interface_id              = module.network_interface.id
  admin_username                    = var.vm_admin_username
  admin_password                    = data.azurerm_key_vault_secret.vm_password.value
  env                               = var.env
  size                              = var.virtual_machine_size
  instance                          = var.instance
  locationShorthand                 = var.location_map[var.location]
  os_disk_storage_account_type      = var.os_disk_storage_account_type
  storage_image_reference_offer     = var.storage_image_reference_offer
  storage_image_reference_publisher = var.storage_image_reference_publisher
  storage_image_reference_sku       = var.storage_image_reference_sku
  storage_image_reference_version   = var.storage_image_reference_version
  depends_on = [
    module.resource_group,
    module.network_interface,
    module.virtual_network,
    module.public_ip,
    module.network_securitygroup,
    data.azurerm_key_vault_secret.vm_password,
    module.subnet
  ]
}

module "sql_server" {
  source                 = "../modules/sql_virtual_machines"
  env                    = var.env
  r_services_enabled     = false
  sqlAdmin_username      = var.sqlAdmin_username
  sqlAdmin_password      = data.azurerm_key_vault_secret.sqlServer_password.value
  virtual_machine_id     = module.virtual_machine.id
  sql_connectivity_port  = var.sql_connectivity_port
  sql_connectivity_type  = var.sql_connectivity_type
  sql_instance_collation = var.sql_instance_collation
  data_luns              = [module.data_disk_sqlData_attach.lun]
  log_luns               = [module.data_disk_sqlLog_attach.lun]
  temp_luns              = [module.data_disk_sqlTempDb_attach.lun]
  sql_license_type       = "PAYG"
  depends_on             = [module.resource_group, module.virtual_machine]

}
