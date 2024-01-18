resource "azurerm_resource_group" "rg" {
    name = var.resource_group_name
    location = var.location
}


resource "azurerm_virtual_network" "networking" {
  name                = var.virtual_network_name
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_subnet" "subnet_connection" {
  name                 = var.subnet_name
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.networking.name
  address_prefixes     = ["10.0.2.0/24"]
  service_endpoints    = ["Microsoft.Sql", "Microsoft.Storage"]
  enforce_private_link_endpoint_network_policies = "true"
}

resource "azurerm_storage_account" "backend_storage" {
  name                = var.storage_account_name
  resource_group_name = azurerm_resource_group.rg.name

  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  network_rules {
    default_action             = "Deny"
    ip_rules                   = ["100.0.0.1"]
    virtual_network_subnet_ids = [azurerm_subnet.subnet_connection.id]
  }

  tags = {
    environment = "staging"
  }
  
}

resource "azurerm_public_ip" "ip" {
  name                = var.public_ip_name
  sku                 = "Standard"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  allocation_method   = "Static"
}


output "storage_account" {
  description = "Name of the storage account created."
  value       = azurerm_storage_account.backend_storage.name
}
