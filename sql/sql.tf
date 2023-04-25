terraform {
  required_providers {
    random = {
      source  = "hashicorp/random"
      version = "3.5.1"
    }
  }
}

resource "random_string" "random" {
  length  = 6
  special = false
  upper   = false
}

resource "azurerm_storage_account" "strgaudit" {
  name                     = "${var.strg_name}${random_string.random.result}strg"
  location                 = var.location
  resource_group_name      = var.resource_group_name
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_mssql_server" "dbsrv" {
  name                         = "${var.base_name}-dbsrv"
  location                     = var.location
  resource_group_name          = var.resource_group_name
  version                      = "12.0"
  administrator_login          = "jorrit"
  administrator_login_password = "KLIM@1980muur"
}

resource "azurerm_mssql_database" "dba" {
  name           = "${var.base_name}-dba"
  server_id      = azurerm_mssql_server.dbsrv.id
  collation      = "SQL_Latin1_General_CP1_CI_AS"
  license_type   = "LicenseIncluded"
  max_size_gb    = 4
  read_scale     = true
  sku_name       = "S0"
  zone_redundant = true
}

resource "azurerm_monitor_diagnostic_setting" "sqldb_diagnostics" {
  name                       = "${var.base_name}-dbalog"
  target_resource_id         = azurerm_mssql_database.dba.id
  log_analytics_workspace_id = var.log_analytics_workspace_id
  #storage_account_id =azurerm_storage_account.storage.id

  enabled_log {
    category = "AuditEvent"

    retention_policy {
      enabled = false
    }
  }

  metric {
    category = "AllMetrics"

    retention_policy {
      enabled = false
    }
  }
}
