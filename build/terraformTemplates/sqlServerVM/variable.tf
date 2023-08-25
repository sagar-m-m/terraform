variable "kv_name" {
  description = "The name of the Key Vault."
  type        = string
}

variable "kv_resource_group_name" {
  description = "The name of the Resource Group in which the Key Vault exists."
  type        = string
}

variable "kv_secret_vm_password_name" {
  description = "The name of the secret in Key Vault for the VM password."
  type        = string
}

variable "kv_secret_sqlServer_password_name" {
  description = "The name of the secret in Key Vault for the SQL Server password."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the Resource Group to create."
  type        = string
}


variable "location_map" {
  description = "Mapping of location full names to shorthand"
  type        = map(string)
  default = {
    "westeurope" = "weu"
    "eastus"     = "eus"
    "westus"     = "wu"
    "westus2"    = "wu2"

  }
}

variable "location" {
  description = "The location to create the resources in."
  type        = string
}

variable "rg_instance" {
  description = "The instance number of the Resource Group."
  type        = string
}

variable "env" {
  description = "The environment to create the resources for (dev, prod, etc)."
  type        = string
}



variable "data_disk_sqlData_storage_account_type" {
  description = "The storage account type for the SQL data disk. Allowed values: Standard_LRS, Premium_LRS, StandardSSD_LRS, UltraSSD_LRS"
  type        = string
  validation {
    condition     = contains(["Standard_LRS", "Premium_LRS", "StandardSSD_LRS", "Premium_ZRS", "PremiumV2_LRS", "UltraSSD_LRS"], var.data_disk_sqlData_storage_account_type)
    error_message = "Invalid storage account type."
  }
}

variable "data_disk_sqlData_disk_size_gb" {
  description = "The size of the data disk for SQL data, in GB."
  type        = number
}


variable "data_disk_sqlLog_storage_account_type" {
  description = "The storage account type for the SQL log disk. Allowed values: Standard_LRS, Premium_LRS, StandardSSD_LRS, UltraSSD_LRS"
  type        = string
  validation {
    condition     = contains(["Standard_LRS", "Premium_LRS", "StandardSSD_LRS", "Premium_ZRS", "PremiumV2_LRS", "UltraSSD_LRS"], var.data_disk_sqlLog_storage_account_type)
    error_message = "Invalid storage account type."
  }
}

variable "data_disk_sqlLog_disk_size_gb" {
  description = "The size of the data disk for SQL log, in GB."
  type        = number
}

variable "virtual_network_name" {
  description = "The name of the virtual network."
  type        = string
}

variable "virtual_network_address_space" {
  description = "The address space of the virtual network."
  type        = string
}


variable "subnet_name" {
  description = "The name of the subnet."
  type        = string
}

variable "subnet_address_prefix" {
  description = "The address prefix of the subnet."
  type        = string
}

variable "subnet_enable_delegation" {
  description = "Whether to enable delegation for the subnet."
  type        = bool
}

variable "subnet_delegation_name" {
  description = "The name of the delegation for the subnet."
  type        = string
}

variable "subnet_service_delegation_name" {
  description = "The name of the service delegation for the subnet."
  type        = string
}

variable "subnet_delegation_actions" {
  description = "The actions for the subnet delegation."
  type        = list(string)
}

variable "network_securitygroup_name" {
  description = "The name of the network security group."
  type        = string
}

variable "public_ip_name" {
  description = "The name of the public IP."
  type        = string
}

variable "public_ip_allocation_method" {
  description = "The allocation method for the public IP. Allowed values: Dynamic, Static"
  type        = string
  validation {
    condition     = contains(["Dynamic", "Static"], var.public_ip_allocation_method)
    error_message = "Invalid allocation method."
  }
}

variable "network_interface_name" {
  description = "The name of the network interface."
  type        = string
}

variable "private_ip_address_allocation_type" {
  description = "The private IP address allocation type for the network interface. Allowed values: Dynamic, Static"
  type        = string
  validation {
    condition     = contains(["Dynamic", "Static"], var.private_ip_address_allocation_type)
    error_message = "Invalid allocation type."
  }
}

variable "private_ip_address_version" {
  description = "The version of the private IP address for the network interface. Allowed values: IPv4, IPv6"
  type        = string
  validation {
    condition     = contains(["IPv4", "IPv6"], var.private_ip_address_version)
    error_message = "Invalid IP address version."
  }
}


variable "virtual_machine_name" {
  description = "The name of the virtual machine."
  type        = string
}

variable "ip_configuration_name" {
  description = "The name of the virtual machine."
  type        = string
}

variable "storage_image_reference_offer" {
  description = "storage_image_reference_offer."
  type        = string
}

variable "storage_image_reference_publisher" {
  description = "storage_image_reference_publisher."
  type        = string
}
variable "storage_image_reference_sku" {
  description = "storage_image_reference_sku."
  type        = string
}
variable "storage_image_reference_version" {
  description = "storage_image_reference_version."
  type        = string
}

variable "virtual_machine_size" {
  description = "The size of the virtual machine."
  type        = string
}

variable "sql_instance_collation" {
  description = "sql_instance_collation"
  type        = string
}

variable "vm_admin_username" {
  description = "The admin username for the virtual machine."
  type        = string
}

variable "sqlAdmin_username" {
  description = "The admin account for the SQL Server."
  type        = string
}

variable "sql_connectivity_port" {
  description = "The SQL Server port."
  type        = string
}

variable "sql_connectivity_type" {
  description = "The connectivity type used for this SQL Server. Possible values are LOCAL, PRIVATE and PUBLIC"
  type        = string
}

variable "os_disk_storage_account_type" {
  description = "The type of managed disk to create"
  type        = string
  validation {
    condition     = contains(["Standard_LRS", "Premium_LRS", "StandardSSD_LRS", "Premium_LRS", "Premium_ZRS", "PremiumV2_LRS", "StandardSSD_ZRS"], var.os_disk_storage_account_type)
    error_message = "The managed_disk_type must be either 'Standard_LRS', 'Premium_LRS', 'StandardSSD_LRS','Premium_ZRS','PremiumV2_LRS' or 'StandardSSD_ZRS'."
  }
}

variable "caching" {
  description = "The type of caching to be used for the Disk"
  type        = string
  validation {
    condition     = contains(["None", "ReadOnly", "ReadWrite"], var.caching)
    error_message = "The caching type can only be 'None', 'ReadOnly', or 'ReadWrite'."
  }
}

variable "instance" {
  type = string

}

variable "data_disk_sqlTempDb_storage_account_type" {
  type = string

  validation {
    condition     = contains(["Standard_LRS", "Premium_LRS", "StandardSSD_LRS", "StandardSSD_LRS","Premium_ZRS", "PremiumV2_LRS", "UltraSSD_LRS"], var.data_disk_sqlTempDb_storage_account_type)
    error_message = "Invalid storage account type."
  }

}

variable "data_disk_sqlTempDb_disk_size_gb" {
  description = "The size of the data disk for SQL data, in GB."
  type        = number
}


