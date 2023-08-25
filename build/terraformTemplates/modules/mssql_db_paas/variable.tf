variable "name" {
  description = "Name of the MSSQL database"
  type        = string
}

variable "env" {
  description = "Environment name"
  type        = string
}

variable "instance" {
  description = "Instance name"
  type        = string
}

variable "server_id" {
  description = "ID of the MSSQL server"
  type        = string
}

variable "collation" {
  description = "Collation of the MSSQL server"
  type        = string
}

variable "max_db_size" {
  description = "Maximum size of the database in GB"
  type        = number
}

variable "sku_name" {
  description = "SKU name of the MSSQL database"
  type        = string
}
