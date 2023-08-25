resource "azurerm_network_interface" "nic" {
  name = var.network_interface_name
  location = var.location
  resource_group_name = var.resource_group_name

ip_configuration {
     name     = var.ip_configuration_name
    subnet_id       = var.subnet_id
    private_ip_address_allocation = var.private_ip_address_allocation
    public_ip_address_id = var.public_ip_address_id
}

}
resource "azurerm_network_interface_security_group_association" "nsg_association" {
  network_interface_id      = azurerm_network_interface.nic.id
  network_security_group_id = var.network_security_group_id
}