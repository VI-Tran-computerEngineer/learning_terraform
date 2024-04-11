# Define public module
module "vpc" {
  source = "terraform-aws-modules/vpc/aws"
  name = "default-us-east-vpc"
  cidr = "172.31.0.0/16"

  azs = ["us-east-2a", "us-east-2b", "us-east-2c", "us-east-2d", "us-east-2e", "us-east-2f"]

  enable_nat_gateway = true
  single_nat_gateway = true
  # one_nat_gateway_per_az = true
}

data "aws_ami" "app_ami" {
  most_recent = true

  filter {
    name   = "name"
    values = ["bitnami-tomcat-*-x86_64-hvm-ebs-nami"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["979382823631"] # Bitnami
}

resource "aws_instance" "web" {
  ami           = data.aws_ami.app_ami.id
  instance_type = var.environment_instance_type["DEV"]

  tags = {
    Name = "HelloWorld"
  }
}
