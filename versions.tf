terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.75.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "tfstate-rg"
    storage_account_name = "tfstate0909"
    container_name       = "terraform-state"
    key                  = "terraform.tfstate"
  }

  required_version = "~> 1.10.1"
}

provider "azurerm" {
  features {}
  skip_provider_registration = true
}
