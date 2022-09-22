locals {
  env = "sit"
  default_tags = {
    env                = local.env
    systemNumber       = "12345"
    billingDescription = "Sandbox"
    billingContact     = "sukhdeep.singh@posten.no"
    billingUnit        = "123456"
    creationSource     = "terraform"
  }
  region = "norwayeast"
}

terraform {
  backend "azurerm" {
    subscription_id      = "18c8d488-9b69-4619-ab58-724f279fe48e" // Sandbox
    resource_group_name  = "rg-terraform"
    storage_account_name = "btfsandbox12"
    container_name       = "tfstate"
    key                  = "sandbox/sandbox.tfstate"
  }
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.20.0"
    }
  }
  required_version = "1.2.8"
}

provider "azurerm" {
  subscription_id = "18c8d488-9b69-4619-ab58-724f279fe48e" // Sandbox
  features {}
}

data "azurerm_client_config" "current" {
}

resource "azurerm_resource_group" "sandbox" {
  name     = "${local.env}-rg-sandbox"
  location = local.region
}
