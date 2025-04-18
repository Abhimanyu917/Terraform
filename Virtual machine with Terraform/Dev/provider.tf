terraform {
  backend "azurerm" {
    resource_group_name  = "mahadev-rg"
    storage_account_name = "mahadevstg"
    container_name       = "mahadevcnt"
    key                  = "mahadev.tfstate"
  }
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.26.0"
    }
  }
}
provider "azurerm" {
  features {}
  subscription_id = "d8764aa6-fc0a-4ae2-a471-a855c00b6940"
}

