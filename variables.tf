
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

/*
variable "log_analytics_workspace_id" {
    type  = string
    description = "id of log_analytics_id "
}

*/
variable "strg_name" {
  type        = string
  description = "the storage account base name"
  default     = "strg"
}