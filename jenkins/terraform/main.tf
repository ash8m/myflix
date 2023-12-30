# https://www.techtarget.com/searchcloudcomputing/tip/How-to-launch-an-EC2-instance-using-Terraform
# First, add the provider code to ensure you use the AWS provider.
provider "aws" {
  region     = "us-east-1"
}


# set up your Terraform resource, which describes an infrastructure object, for the EC2 instance.  This will create the instance. Define the instance type and configure the network.

resource "aws_security_group" "test_sg" {
  name = var.sec_group_name
  description = "allow ssh and https"
  vpc_id = var.vpc_id

  // To Allow SSH Transport
  ingress {
    from_port = 22
    protocol = "tcp"
    to_port = 22
    cidr_blocks = ["94.175.54.63/32"]
    description = "desk-ssh"
  }

  // To Allow Port 8080 Transport
  ingress {
    from_port = 8080
    protocol = "tcp"
    to_port = 8080
    cidr_blocks = ["94.175.54.63/32"]
    description = "desk-http"
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }

  #lifecycle {
  #  create_before_destroy = true
  #}
}

resource "aws_instance" "ec2_instance" {
    ami = "ami-0c7217cdde317cfec" # ubuntu 22
    subnet_id = var.subnet_id
    instance_type = var.instance_type
    key_name = "ubn2_22"

  vpc_security_group_ids = [
    aws_security_group.test_sg.id
  ]
  root_block_device {
    delete_on_termination = true
    volume_size = 30
    volume_type = "gp3"
  }
  tags = {
    Name ="JENKINS"
    Environment = "TEST"
    OS = "UBUNTU"
    # Managed = "IAC"
  }


  depends_on = [ aws_security_group.test_sg ]


}

output "ec2instance" {
  value = aws_instance.ec2_instance.public_ip
}