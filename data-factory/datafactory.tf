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

<<<<<<< HEAD
resource "azurerm_data_factory_integration_runtime_azure_ssis" "ir" {
  name            = "${var.base_name}-ir"
  data_factory_id = azurerm_data_factory.df.id
  location        = var.location

  node_size = "Standard_D8_v3"
=======
resource "azurerm_data_factory_integration_runtime_azure" "example" {
  name            = "${var.base_name}-ir"
  data_factory_id = azurerm_data_factory.df.id
  location        = var.location
>>>>>>> 36b95cedf8ea9979b22a74025b3f3fb8e7c38287
}

