variable "add_tag" {
  description = "whether if you want to add random interger as a tag"
  type        = bool
  default     = true
}

variable "docker_server_name" {
  description = "Name of you VPC"
  type        = string
  default     = "my-dockey"
}

variable "instance_type" {
  description = "Type of the aws instance"
  type        = string
}

variable "key_name" {
  description = "Key used for instances"
  type        = string
}

