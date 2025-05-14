variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "subnet_cidr" {
  description = "CIDR block for the subnet"
  type        = string
  default     = "10.0.0.0/16"
}

variable "subnet_name" {
  description = "Name of the subnet"
  type        = string
  default     = "Demo-public-subnet"
}

variable "rt_name" {
  description = "Name of the route table"
  type        = string
  default     = "Demo-public-rt"
}

variable "igw_name" {
  description = "Name of the Internet Gateway"
  type        = string
  default     = "Demo-IGW"
}
