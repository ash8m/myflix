# https://www.techtarget.com/searchcloudcomputing/tip/How-to-launch-an-EC2-instance-using-Terraform
# First, add the provider code to ensure you use the AWS provider.
provider "aws" {
  region     = "us-east-1"
  shared_credentials_files = ["/home/ubuntu/.aws/credentials"]
}

data "aws_security_group" "existing_sg" {
  name = var.sec_group
}

data "aws_eip" "existing_eip" {
  public_ip = var.elastic_ip
}

resource "aws_instance" "ec2_instance" {
    ami = "ami-0c7217cdde317cfec" # ubuntu 22
    subnet_id = var.subnet_id
    instance_type = var.instance_type
    key_name = "ubn2_22"

  vpc_security_group_ids = [
    data.aws_security_group.existing_sg.id
  ]
  root_block_device {
    delete_on_termination = true
    volume_size = 20
    volume_type = "gp3"
  }
  tags = {
    Name ="web-server-2"
    Environment = "TEST"
    OS = "UBUNTU"
  }
}

resource "aws_eip_association" "eip_assoc" {
  instance_id   = aws_instance.ec2_instance.id
  allocation_id = data.aws_eip.existing_eip.id
}