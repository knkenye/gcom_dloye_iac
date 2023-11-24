resource "azurerm_resource_group" "RG" {
  name     = var.resource_group_name
  location = var.location
}


resource "azurerm_mysql_flexible_server" "MSQL001" {
  name                         = var.mysql_flexible_server_name
  resource_group_name          = azurerm_resource_group.RG.name
  location                     = azurerm_resource_group.RG.location
  administrator_login          = var.administrator_login
  administrator_password = random_password.RD001.result
  sku_name   = "B_Standard_B1s"
  zone = 3

  tags = {

      ApplicationName  = "Gecom BTX" 
      ApplicationSponsor = " luis.olguin@vinci-construction.com"
      TechnicalContact  = "luis.olguin@vinci-construction.com" 
      Environement = "Prd"
      module = "msql_database"  
  }
}

resource "azurerm_mysql_flexible_database" "MSQLDTB" {
  name           = var.mysql_flexible_database_name
  resource_group_name = azurerm_resource_group.RG.name
  server_name    = azurerm_mysql_flexible_server.MSQL001.name
  collation      = "utf8_unicode_ci"
  charset        = "utf8"
 
}

resource "azurerm_key_vault" "KV001" {
   name                = var.key_vault_name
  resource_group_name = azurerm_resource_group.RG.name
  location            = azurerm_resource_group.RG.location
  tenant_id = data.azurerm_client_config.current.tenant_id
  sku_name = "standard"

tags = {

      ApplicationName  = "Gecom BTX"
      ApplicationOwner = "luis.olguin@vinci-construction.com" 
      ApplicationSponsor = " luis.olguin@vinci-construction.com"
      TechnicalContact  = "luis.olguin@vinci-construction.com" 
      Environement = "Prd"
      LZ_Onboarding_Version = "0.1"  
  }

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    secret_permissions = [
      "Get",
      "List",
      "Set",
     "Recover",
    ]
    key_permissions = [
      "Recover"
    ]
  }
  
}

resource "random_password" "RD001" {
  length           = 14
  special          = true
  upper            = true
  min_upper        = 4
  min_special      = 3
  min_numeric      = 3
}

resource "azurerm_key_vault_secret" "SCR001" {
  name         = var.key_vault_secret_name
  value        = random_password.RD001.result
  key_vault_id = azurerm_key_vault.KV001.id
}




terraform {
  required_version = ">= 0.15.4"

  required_providers {
    azurerm = ">= 3.40.0"
  }
 
}

provider "azurerm" {
    features {
      
    }
  
}