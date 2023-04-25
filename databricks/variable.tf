variable "location" {
  description = "Resource Group Location"
  type = string
  default = "north europe"
}

variable "resource_group_name" {
  description = "Resource Group Name"
  type = string
   default = "something-jorrit"
}

variable "base_name" {
    type = string
    description = "the base name"
}
