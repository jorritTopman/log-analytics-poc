# Resource-1: Azure Resource Group
resource "azurerm_resource_group" "rg" {
  name = "${var.base_name}-rg"
  location = var.location
}