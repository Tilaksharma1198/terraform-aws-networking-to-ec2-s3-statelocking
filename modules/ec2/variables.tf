variable "ami" {
  description = "AMI ID for the EC2 instance"
  type        = string
  default     = "ami-084568db4383264d4"
}

variable "instance_type" {
  description = "Instance type"
  type        = string
  default     = "t2.micro"
}

variable "subnet_id" {
  description = "ID of the subnet"
  type        = string
}

variable "vpc_id" {
  description = "ID of the VPC"
  type        = string
}

variable "sg_name" {
  description = "Name of the security group"
  type        = string
  default     = "sg2"
}

variable "instance_name" {
  description = "Name of the EC2 instance"
  type        = string
  default     = "Demo-EC2"
}
