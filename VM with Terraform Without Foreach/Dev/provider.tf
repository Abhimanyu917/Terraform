terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.32.0"
    }
  }
}

provider "azurerm" {
 
 subscription_id = "1212a59c-637f-45eb-8b74-8032483be797"
  features {}
}