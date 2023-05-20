terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  // Terraformの必要バージョンを指定する
  required_version = ">= 1.2.0"
}

provider "aws" {
  // AWSリージョンを指定する
  region = "us-west-2"
}

// AWSインスタンスのリソースブロック
resource "aws_instance" "app_server" {
  ami           = "ami-830c94e3"
  instance_type = "t2.micro"

  // インスタンスに付けるタグを指定する
  tags = {
    Name = "ExampleAppServerInstance"
  }
}
