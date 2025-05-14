variable "instance_ip" {
  description = "Public IP of the EC2 instance"
  type        = string
}

resource "null_resource" "remote_setup" {
  depends_on = [aws_instance.example]

  connection {
    type        = "ssh"
    user        = "ec2-user" # or "ubuntu" depending on AMI
    private_key = file("~/.ssh/your-key.pem")
    host        = var.instance_ip
  }

  provisioner "remote-exec" {
    inline = [
      "mkdir -p ~/remote_folder",
      "echo 'Hi Shamim, How was your Day ??' > ~/remote_folder/Demo.txt"
    ]
  }
}
