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
  region = "ap-south-1"
}

resource "aws_instance" "app_server" {
  ami           = "ami-02eb7a4783e7e9317"
  instance_type = "t2.micro"

  tags = {
    Name = "ExampleAppServerInstance2023"
  }
}

output "app_server" {
  value = "${aws_instance.app_server.public_ip}"
}
