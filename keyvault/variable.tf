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
<<<<<<< HEAD

variable "log_analytics_workspace_id" {
  type    = any
  default = []
}
=======
>>>>>>> 36b95cedf8ea9979b22a74025b3f3fb8e7c38287
