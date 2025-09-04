terraform {
  required_version = ">= 1.11.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.43.0"
    }
  }

  backend "azurerm" {}
}

provider "azurerm" {
  subscription_id = var.subscriptions["sub-platform-strategic"].subscription_id

  features {}

  storage_use_azuread = true
}

provider "azurerm" {
  alias           = "sub-platform-connectivity"
  subscription_id = var.subscriptions["sub-platform-connectivity"].subscription_id

  features {}

  storage_use_azuread = true
}

provider "azurerm" {
  alias           = "sub-visualstudio-enterprise"
  subscription_id = var.subscriptions["sub-visualstudio-enterprise"].subscription_id

  features {}

  storage_use_azuread = true
}
