resource "azurerm_databricks_workspace" "example" {
  name                = "${var.base_name}-dbr"
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = "standard"
}