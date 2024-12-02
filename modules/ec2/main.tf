
resource "aws_instance" "public_instance" {

  ami           = var.machine-image
  instance_type = var.machine-instance-type
  subnet_id     = var.public_subnet_id

  tags = {
    "Name" = "Public EC2 Instance"

  }

}

resource "aws_instance" "private_instance" {

  ami           = var.machine-image
  instance_type = var.machine-instance-type
  subnet_id     = var.private_subnet_id

  tags = {
    "Name" = "Private EC2 Instance"
  }

}

resource "aws_security_group" "instance_security_group" {
  name        = "AWS Instance Security Group"
  description = "This is the security group for all of the isntances in this project"

}

