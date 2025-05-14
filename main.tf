terraform {
  backend "s3" {
    bucket         = "demo-state-locking-s3"
    key            = "home/ubuntu/DemoTerraform/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "dynamodb-state-locking"
  }
}

module "vpc" {
  source    = "./modules/vpc"
  vpc_cidr  = "10.0.0.0/16"
  vpc_name  = "DemoVPC"
}

module "networking" {
  source       = "./modules/networking"
  vpc_id       = module.vpc.vpc_id
  subnet_cidr  = "10.0.0.0/16"
  subnet_name  = "Demo-public-subnet"
  rt_name      = "Demo-public-rt"
  igw_name     = "Demo-IGW"
}

module "ec2" {
  source         = "./modules/ec2"
  ami            = "ami-084568db4383264d4"
  instance_type  = "t2.micro"
  subnet_id      = module.networking.subnet_id
  vpc_id         = module.vpc.vpc_id
  sg_name        = "sg2"
  instance_name  = "Demo-EC2"
}

resource "local_file" "Demo" {
  filename = "home/ubuntuDemo.txt"
  content  = "Hi Shamim How was your Day ??"
}
