variable "resource_group_name" {
  description = "Name of the Resource Group to Create Storage Account"
  type = string
}
variable "location" {
    description = "Location to create Azure resources"
    type = string
}
variable "virtual_network_name" {
    description = "Name of the virtual network to create Storage Account"
    type = string
}
variable "subnet_name" {
    description = "Name of the subnet to create Storage Account"
    type = string
}
variable "storage_account_name" {
    description = "Name of the Storage Account"
    type = string
}
variable "endpoint_name" {
    description = ""
    type = string
}
variable "public_ip_name" {
  description = "value"
  type = string
}
variable "lb_name" {
    description = "value"
    type = string
}
variable "private_endpoint_name" {
    description = "value"
    type = string
}
variable "private_link_service" {
  description = "value"
  type = string
}
variable "fileshare_name" {
    description = ""
    type = string
}
variable "container_name" {
    description = "value"
    type = string
}