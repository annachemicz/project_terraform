provider "azurerm" {
    version = "~> 3.24"
    features {}
}

terraform {
    backend "azurerm" {}
}

data "azurem_client_config" "current" {}

resource "azurerm_resource_group_name" "rg" {
    name = var.resource_group_name
    location = "westeurope"
}

resource "azurem_storage_account" "storagelogs" {
    name = var.storage_account_name
    resource_group_name = var.resource_group_name
    location = "westeurope"
    account_tier = "Standard"
    account_replication_type = "LRS"
}
