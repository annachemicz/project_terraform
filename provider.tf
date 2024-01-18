# We strongly recommend using the required_providers block to set the
# Azure Provider source and version being used
# Configure the Microsoft Azure Provider
provider "azurerm" {
  subscription_id = "8483511d-2d48-4467-beca-8f1f9f1d7d9c"
  client_id       = "4b56e34f-f4fb-48d7-b9e6-52a65c4b60a5"
  client_secret   = "LdS8Q~gAdB4bHVeUDMleqbl6zaArYUzYPCKr.aw9"
  tenant_id       = "4bf94721-f18e-43e9-a1ee-543cf5eda400"
  features {}
}