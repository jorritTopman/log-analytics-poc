terraform {
  required_providers {
    random = {
      source = "hashicorp/random"
      version = "3.5.1"
    }
  }
}

resource "random_string" "random" {
  length = 6
  special = false
  upper = false
}

resource "azurerm_storage_account" "dhl-strg" {
  name                     = "${var.base_name}${random_string.random.result}strg"
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  account_kind             = "StorageV2"
  is_hns_enabled           = "true"
  #tags                     = local.common_tags
}

resource "azurerm_storage_data_lake_gen2_filesystem" "dhl-filesystem" {
  name               = "data"
  storage_account_id = azurerm_storage_account.dhl-strg.id

  properties = {
    hello = "aGVsbG8="
  }
}

resource "azurerm_monitor_diagnostic_setting" "storage" {
  name                         = azurerm_storage_account.dhl-strg.name
  target_resource_id           = azurerm_storage_account.dhl-strg.id
  #storage_account_id           = azurerm_storage_account.diag_storage.id
  log_analytics_workspace_id   = var.log_analytics_workspace_id

  /*enabled_log {
    # Fails, even when having access to private preview of diagnostic log settings
    # https://docs.microsoft.com/en-us/azure/storage/common/monitor-storage?tabs=azure-powershell#configuration
    # https://docs.microsoft.com/en-us/azure/azure-monitor/platform/resource-logs-categories#microsoftstoragestorageaccountsblobservices
    category                   = "StorageRead"

    retention_policy {
      enabled                  = true
      days                     = 7
    }
  }
  */
  metric {
    category = "AllMetrics"

    retention_policy {
      enabled = true
      days    = 7
    }
  }
}
