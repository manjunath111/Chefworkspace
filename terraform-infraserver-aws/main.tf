terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  region = var.region
}

resource "aws_network_interface" "example" {
  subnet_id       = var.subnet_ids[0]
  security_groups = [var.security_group_id]

  tags = {
    X-Contact = "Manjunath.reddy@progress.com"
  }
}

resource "aws_instance" "infra-server" {
  count                       = var.instance_count
  ami                         = var.ami_id
  instance_type               = var.instance_type
  key_name                    = var.key_name
  user_data                   = filebase64("userdata.sh")

  network_interface {
    network_interface_id = aws_network_interface.example.id
    device_index         = 0
  }

  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file("${var.key_pair_public_key}") # Change this to the path of your PEM file
    timeout     = "15m"
  }

  tags = {
    Name            = "chef-infra-server-tf"
    X-Contact       = "Manjunath.reddy@progress.com"
    X-Dept          = "CS"
    X-Do-NOT-REMOVE = "true"
  }

  root_block_device {
    delete_on_termination = true
    volume_size           = 20
    volume_type           = "gp2"
  }

  lifecycle {
    create_before_destroy = true
  }
}




