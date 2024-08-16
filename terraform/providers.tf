terraform {
  required_version = ">= 1.6.2"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.116.0"
    }
  }

  backend "azurerm" {}
}

provider "azurerm" {
  subscription_id = var.subscriptions["sub-platform-strategic"].subscription_id

  features {}
}

provider "azurerm" {
  alias           = "sub-platform-connectivity"
  subscription_id = var.subscriptions["sub-platform-connectivity"].subscription_id

  # This is a workload repository so won't have permissions to register providers
  skip_provider_registration = true

  features {}
}

provider "azurerm" {
  alias           = "sub-visualstudio-enterprise"
  subscription_id = var.subscriptions["sub-visualstudio-enterprise"].subscription_id

  # This is a workload repository so won't have permissions to register providers
  skip_provider_registration = true

  features {}
}
