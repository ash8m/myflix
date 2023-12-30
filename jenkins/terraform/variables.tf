variable "vpc_id" {
  type = string
  default = "vpc-04fe4cd0d4b4c46b4"
}

variable "sec_group_name" {
    type = string
    default = ""
}
variable "instance_type" {
    type = string
    default = "t2.micro"
}

variable "subnet_id" {
    type = string
    default = "subnet-0b396dd0fc129dc21"
}

