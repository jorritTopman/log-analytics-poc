data "azurerm_subscription" "current" {}
data "azurerm_client_config" "current" {}
data "azurerm_subscription" "primary" {}


data "azurerm_resources" "terraform-state-storage" {
  type = "Microsoft.Storage/storageAccounts"

  required_tags = {
    role        = "state_storage"
  }
}

