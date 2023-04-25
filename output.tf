## TEST DATASOURCES using OUTPUTS
# 1. My Current Subscription Display Name
output "current_subscription_display_name" {
  value = data.azurerm_subscription.current.display_name
}

# 2. My Current Subscription Id
output "current_subscription_id" {
  value = data.azurerm_subscription.current.subscription_id
}

# 3. My Current Subscription Spending Limit
output "current_subscription_spending_limit" {
  value = data.azurerm_subscription.current.spending_limit
}

output "storag_account_terraform_statefile" {
  #value = data.azurerm_resources.terraform-state-storage.name
  value = data.azurerm_resources.terraform-state-storage
}

output "root_storage_account_name" {
  value       = module.storageaccounts.storage_account_name
}

output "root_storage_account_id" {
  value       = module.storageaccounts.storage_account_id
}

output "log_analytics_workspace_id" {
    value     = module.log-analytics.log_analytics_workspace_id
}
