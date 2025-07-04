variable "aws_region" {
  default = "us-east-1"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "ami_name" {
  default = "kn-apppage-ami"
}

variable "ssh_username" {
  default = "ec2-user"
}

variable "source_ami" {
  # Source AMI of Amazon Linux 2023
  default = "ami-09e6f87a47903347c"
}


source "amazon-ebs" "app_ami_builder" {
  region          = var.aws_region
  instance_type   = var.instance_type
  ami_name        = var.ami_name
  ssh_username    = var.ssh_username
  source_ami      = var.source_ami
  ami_description = "Custome AMI with Docker & Git Installed"
}

build {
  sources = ["source.amazon-ebs.app_ami_builder"]
  provisioner "shell" {
    script = "docker_git_script.sh" # Reference the external script
  }
}
