variable "resource_group_name" {
    description = "Name of the new Resource Group to create the Storage Account."
    type = string
}

variable "storage_account_name" {
    description = "Storage Account Name."
    type = string
}

variable "location" {
    description = "Location to create the Azure resources."
    type = string
}

variable "account_kind" {
    description = "Defines the kind of account."
    type = string
    default = "StorageV2"  
}

variable "account_tier" {
    description = "Defines the tier to use for this storage account. Validate options are Standard and Premium."
    type = string
    default = "Standard"
}

variable "account_replication_type" {
    description = "Storage Account replication type, eg. LRS, ZRS, GRS"
    type = string
}

variable "days_before_deletion" {
    description = "Number of days a blob should be retained following deletion."
    type = number
}

variable "enable_hns" {
    description = "True or False for enabling hierarchical namespace for ADLS Gen2."
    type = bool
    default = false
}

variable "large_file_share_enabled" {
    description = "True or False for enabling large file share."
    type = bool
    default = false
}

variable "key_vault_resource_group" {
    description = "Pre-existing Resource Group containing the Azure Key Vault for the Customer Manage Key."
    type = string
}

variable "key_vault_name" {
    description = "Pre-existing Azure Key Vault containing the Customer Manage Key."
    type = string
}

variable "encryption_key_name" {
    description = "Pre-existing Customer Manage Key to use for encrypting the Storage Account."
    type = string
}

variable "private_endpoint_subresources" {
    description = "List of the subresources for the Provate Endpoints e.g. blob, dfs, file, queue"
    type = list(string)
    default = [ "blob" ]
}

variable "vnet_rg_name" {
  description = "Pre-existing Resource Group containing the spoke VNET and Sunets, to use for Private Endpoint."
  type = string
}

variable "vnet_name" {
    description = "Pre-existing spoke VNET and Sunets, to use for Private Endpoint."
    type = string
}

variable "subnet_name" {
    description = "Pre-existing Subnet, to use for Private Endpoint."
    type = string
}

#Storage subresource

variable "container_list" {
    description = "List of containers to create and their access level."
    type = list(object({ name = string, access_type = string}))
    default = []  
}

variable "file_share_list" {
    description = "List of fileshare to create and their quota."
    type = list(object({ name = string, quota = string}))
    default = []
}

variable "table_list" {
    description = "List of storage tables."
    type = list(string)
    default = []  
}

variable "queue_list" {
    description = "List of stages queues"
    type = list(string)
    default = []
}

variable "dfs_list" {
    description = "List of stages dfs."
    type = list(string)
    default = []  
}

#Storage account lifecycle management
variable "lifecycles" {
    description = "Configure Azure Storage firewalls and virtual networks."
    type = list(object({prefix_match = set(string), tier_to_cool_after_days = number, tier_to_archive_after_days = number, delete_after_days = number, snapshot_delete_after_days = number}))
    default = []
}

variable "enable_static_website" {
    description = "True or False for enabling static website."
    type = bool
    default = false
}

variable "index_document" {
    description = "Index page for static website (ex.index.html)"
    type = string
    default = ""
}

variable "error404_document" {
    description = "Error 404 page for static website (ex. error.html)"
    type = string
    default = ""
}