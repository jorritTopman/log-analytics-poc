<<<<<<< HEAD
#resource group reation module
=======
#resource group creation module
>>>>>>> 36b95cedf8ea9979b22a74025b3f3fb8e7c38287
module "resource_group" {
  source    = "./resource_group"
  base_name = local.base_name
  location  = "westeurope"
}

<<<<<<< HEAD
#storage account module
=======
#storage account creation module
>>>>>>> 36b95cedf8ea9979b22a74025b3f3fb8e7c38287
module "storageaccounts" {
  source              = "./storageaccounts"
  base_name           = local.strg_name
  resource_group_name = module.resource_group.rg_name_out
  location            = "westeurope"
<<<<<<< HEAD
  log_analytics_workspace_id  = module.log-analytics.log_analytics_workspace_id
}

#Azure log analytics module 
=======
}

#Azure log analytics creation module
>>>>>>> 36b95cedf8ea9979b22a74025b3f3fb8e7c38287
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
<<<<<<< HEAD
}

module "databricks" {
  source              = "./databricks"
  base_name           = local.base_name
  resource_group_name = module.resource_group.rg_name_out
  location            = "westeurope"
}


=======
}




>>>>>>> 36b95cedf8ea9979b22a74025b3f3fb8e7c38287
