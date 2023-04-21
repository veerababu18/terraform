terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  #  required_version = ">= 1.3.0"
}

provider "aws" {
   access_key = var.aws_access_key
  secret_key = var.aws_secret_key
  region = "ap-south-1"
}

resource "aws_instance" "app_server" {
  ami           = "ami-02eb7a4783e7e9317"
  instance_type = "t2.micro"

  tags = {
    Name = "ExampleAppServerInstance"
  }
}

output "app_server" {
  value = "${aws_instance.app_server.public_ip}"
}
