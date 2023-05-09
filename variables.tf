
variable "environment" {
  type        = string
  description = "specify environment name"
}

variable "team" {
  type        = string
  description = "team name"
}

variable "base_name" {
  type        = string
  description = "the storage account base name"
  default     = "joreri"
}

variable "strg_name" {
  type        = string
  description = "the storage account base name"
  default     = "strg"
}

variable "resource_group_name" {
  type = string
  description = "resource group name"
  default = "rg-sandbox-jorrit"
}
