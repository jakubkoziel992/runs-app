variable "my_location" {
  description = "location used in projects"
  type = string
  default = "europe-central2"
}

variable "instance_type" {
  description = "type of instance used in the cluster"
  type = string
  default = "e2-medium"
}

variable "disk_size" {
  description = "disk size"
  type = string
  default = 10
}

variable "my_nodes" {
  description = "number of nodes used in cluster"
  type = string
  default = 1
}

