#resource group creation module
module "resource_group" {
  source    = "./resource_group"
  base_name = local.base_name
  location  = "westeurope"
}

#storage account creation module
module "storageaccounts" {
  source              = "./storageaccounts"
  base_name           = local.strg_name
  resource_group_name = module.resource_group.rg_name_out
  location            = "westeurope"
}

#Azure log analytics creation module
module "log-analytics" {
  source              = "./log-analytics"
  base_name           = local.base_name
  resource_group_name = module.resource_group.rg_name_out
  location            = "westeurope"
}

module "data-factory" {
  source              = "./data-factory"
  base_name           = local.base_name
  resource_group_name = module.resource_group.rg_name_out
  location            = "westeurope"
}

module "keyvault" {
  source                      = "./keyvault"
  base_name                   = local.base_name
  resource_group_name         = module.resource_group.rg_name_out
  location                    = "westeurope"
  log_analytics_workspace_id  = module.log-analytics.log_analytics_workspace_id
}

module "sql" {
  source                     = "./sql"
  base_name                  = local.base_name
  resource_group_name        = module.resource_group.rg_name_out
  location                   = "westeurope"
  log_analytics_workspace_id = module.log-analytics.log_analytics_workspace_id
}




