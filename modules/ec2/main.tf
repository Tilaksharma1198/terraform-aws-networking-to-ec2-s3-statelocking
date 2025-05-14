resource "aws_security_group" "sg" {
  name   = var.sg_name
  vpc_id = var.vpc_id

  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
  }
}

resource "aws_instance" "example" {
  ami                    = var.ami
  instance_type          = var.instance_type
  subnet_id              = var.subnet_id
  vpc_security_group_ids = [aws_security_group.sg.id]

user_data = <<-EOF
              #!/bin/bash
              echo "Hi Shamim How was your Day ??" > /home/ubuntu/Demo.txt
              EOF
  
tags = {
    Name = var.instance_name
  }
}
