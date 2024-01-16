variable "vpc_id" {
  type = string
  default = "vpc-04fe4cd0d4b4c46b4"
}

variable "sec_group" {
    type = string
    default = "test-server-sg"
}

variable "instance_type" {
    type = string
    default = "t2.medium"
}

variable "subnet_id" {
    type = string
    default = "subnet-0be4db7ab745d234e"
    
}

variable "elastic_ip" {
    type = string
    default = "44.198.29.234"
}

