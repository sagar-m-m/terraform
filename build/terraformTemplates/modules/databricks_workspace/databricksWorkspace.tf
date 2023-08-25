resource "azurerm_databricks_workspace" "dbws" {
  name                = lower("dbws-dep-${var.env}-${var.location_shorthand}-${var.instance}")
  resource_group_name = var.resource_group_name
  location            = var.location
  sku                 = var.sku
  managed_resource_group_name = "rg-dbwsmanaged-${var.env}-${var.location_shorthand}-${var.instance}"
  infrastructure_encryption_enabled = false
  
  custom_parameters {

    no_public_ip = false
    private_subnet_name = var.private_subnet_name
    public_subnet_name = var.public_subnet_name
    virtual_network_id = var.virtual_network_id    
    storage_account_name = var.storage_account_name
    public_subnet_network_security_group_association_id = var.public_subnet_network_security_group_association_id
    private_subnet_network_security_group_association_id = var.private_subnet_network_security_group_association_id
    nat_gateway_name = "nat-dbx${var.sku}-${var.env}-${var.instance}"
    public_ip_name = "ip-dbx${var.sku}-${var.env}-${var.instance}"
    
  }
  

 tags = {
    env = var.env
    
  } 


  lifecycle {
    ignore_changes = [tags]
    
  }
}