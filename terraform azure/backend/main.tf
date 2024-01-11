resource "azurerm_resource_group_name" "rg" {
    name = var.resource_group_name
    location = "westeurope"
}

resource "azurem_storage_account" "storagelogs" {
    name = "storagelogs"
    resource_group_name = var.resource_group_name
    location = "westeurope"
    account_tier = "Standard"
    account_replication_type = "LRS"
}

resource "azurerm_storage_container" "tfstate" {
    name = "tfstate"
    storage_account_name = azurerm_storage_account.storagelogs.name
    container_access_type = "private"
}