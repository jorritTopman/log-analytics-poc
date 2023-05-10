variable "location" {
  description = "Resource Group Location"
  type = string
  #default = "north europe"
}

variable "resource_group_name" {
  description = "Resource Group Name"
  type = string
}

variable "base_name" {
    type = string
    description = "the storage account base name"
}

variable "log_analytics_workspace_id" {
  type    = any
  default = []
}