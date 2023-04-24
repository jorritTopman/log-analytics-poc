terraform {
  required_providers {
    random = {
      source = "hashicorp/random"
      version = "3.5.1"
    }
  }
}

resource "azurerm_data_factory" "df" {
  name                = "${var.base_name}-df"
  location            = var.location
  resource_group_name = var.resource_group_name
}

resource "azurerm_data_factory_integration_runtime_azure" "example" {
  name            = "${var.base_name}-ir"
  data_factory_id = azurerm_data_factory.df.id
  location        = var.location
}

