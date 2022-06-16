terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.0.2"
      configuration_aliases = [
        azurerm.remote
      ]
    }
  }
}