variable "ami_id" {}
variable "instance_type" {}
variable "key_name" {}
variable "subnet_ids" {}
variable "security_group_ids" {}
variable "instance_count" {}
variable "name" {}
variable "security_group_id" {
  description = "The ID of the security group to assign to the instance"
  type        = string
}
