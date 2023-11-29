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


variable "service_plan_name" {
    type = string
  
}

variable "linux_web_app_name" {
    type = string
  
}
variable "sku_tier" {
    type = string
    default = "Basic"
  
}

variable "sku_size" {
    type = string
    default = "S1"
}

variable "dotnet_version" {
  type        = string
  default     = "v5.0"
}

variable "https_only" {
  type        = bool
  default     = true
}

variable "os_type" {
  type        = string
  default     = "Linux"
}

variable "service_plan_id" {
  type        = number
  
}

