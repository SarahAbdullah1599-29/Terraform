#terraformsetup
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "3.23.0"
    }
  }
}
#configure the AWS Provider
provider "aws" {
  region  = "us-east-1"
  access_key = ""
  secret_key = ""
}

resource "aws_vpc" "creating_our_first_VPC" {
    cidr_block = "10.0.0.0/16"
    instance_tenancy = "default"

    tags = {
        name = "VPC by Terraform"
    }
}

resource "aws_subnet" "Subnet_1" {
  vpc_id     = aws_vpc.creating_our_first_VPC.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "Subnet_1"
  }
}

resource "aws_s3_bucket" "b"{
    bucket = "privatebucketdonottouchplz000"
    acl = "private"

    tags = {
        Name = "terraformbucket0000"
        Environment = "Dev"
    }
}
resource "aws_instance" "my-first-instance" {
  ami           = "ami-0be2609ba883822ec"
  instance_type = "t2.micro"

  tags = {
    Name = "HelloWorld"
  }
}
