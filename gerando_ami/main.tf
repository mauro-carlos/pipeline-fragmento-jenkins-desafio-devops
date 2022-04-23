provider "aws" {
  region = "us-east-1"
}

variable "id_ec2" {
  type = string
}

resource "aws_ami_from_instance" "ami_fragmento" {
  name               = "desafio-devops-fragmento"
  source_instance_id = var.id_ec2
}

output "ami" {
  value = [
    "AMI: ${aws_ami_from_instance.ami_fragmento.id}"
  ]
}