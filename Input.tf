variable "resource_group_name" {
    type = string 
  
}

variable "location" {
    type = string
    default = "Central US"
  
}


variable "mysql_flexible_server_name" {
    type = string
     
}
variable "administrator_login" {
    type = string
     
}

variable "mysql_flexible_database_name" {
    type = string
      
}

variable "key_vault_name" {
    type = string
      
}

variable "key_vault_secret_name" {
    type = string
      
}

