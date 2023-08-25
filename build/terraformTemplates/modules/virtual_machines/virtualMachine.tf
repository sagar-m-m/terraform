data "azurerm_key_vault_secret" "username" {
  name = var.username_secret_name
  key_vault_id = var.key_vault_id

}

data "azurerm_key_vault_secret" "password" {
  name = var.password_secret_name
  key_vault_id = var.key_vault_id

}

resource "azurerm_virtual_machine" "virtual_machine" {
  name     = var.virtual_machine_name
  resource_group_name = var.resource_group_name
  network_interface_ids = [var.network_interface_id]
   location = var.location
   vm_size     = var.vm_size

 os_profile {
    computer_name  = "hostname"
    admin_username = data.azurerm_key_vault_secret.username.value
    admin_password = data.azurerm_key_vault_secret.password.value


  }
   
   os_profile_linux_config {
    disable_password_authentication = false
  }
   storage_os_disk {
    name              = "testrelay"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = var.managed_disk_type
    }
      storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
}
      }