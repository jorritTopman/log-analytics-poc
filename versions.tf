terraform {
  required_version = ">=1.0.0"
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
    }
  }
}

provider "azurerm" {
  subscription_id = "d5409f5d-f4fe-4cf4-aca2-81cb34d37733"
  features {}
}