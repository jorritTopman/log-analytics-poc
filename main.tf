terraform {
  required_version = ">=1.0.0"
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
    }
  }
backend "azurerm" {
  resource_group_name   = "terraform-storage-rg"
  storage_account_name  = "terraformstatetopman"
  container_name        = "tfstatefiles"
  key = "terraform.tfstate" 
}
}

provider "azurerm" {
  subscription_id = "81c885bc-2dea-400e-8f5d-872acf230e16" 
  tenant_id = "f68a44d8-0e21-470d-b301-f7dba9d4f515"
  client_id = "da920840-7cea-4d37-8b4f-6e15c65f28d7"
  client_secret = "4k98Q~0hZ5DOrYz~Ayvfqf5JsJkfKnMrLpe.3bCK"
  features {}
}



module "resource_group" {
  source = "./resource_group"
  base_name = local.base_name
  location = "westeurope"
}

module "storageaccount" {
  source = "./storageaccounts"
  base_name = local.strg_name
  resource_group_name = module.resource_group.rg_name_out
  location = "westeurope"
}

module "log-analytics" {
  source = "./log-analytics"
  base_name = local.base_name
  resource_group_name = module.resource_group.rg_name_out
  location = "westeurope"
}



