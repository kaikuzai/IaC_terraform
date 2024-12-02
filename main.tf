terraform {
  backend "s3" {
    bucket         = "terraform-tf-state-dylanokyere"
    key            = "tf-infra/terraform.tfstate"
    region         = "eu-central-1"
    dynamodb_table = "terraform-state-locking"
    encrypt        = true
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "eu-central-1"
}

# Network Module 
module "network" {
  source = "./modules/network"

}

# Compute Module 
module "ec2" {
  source            = "./modules/ec2"
  public_subnet_id  = module.network.public_subnetA1_id
  private_subnet_id = module.network.private_subnet_id

  depends_on = [module.network]
}

# Load Balancer Module 
module "load_balancer" {
  source             = "./modules/loadbalancer"
  VPC_id             = module.network.virtual_private_cloud_id
  public_instance_id = module.ec2.public_instance_id
  public_subnet      = module.network.public_subnets
  depends_on         = [module.network, module.ec2]
}
















resource "aws_s3_bucket" "terraform_state" {
  bucket        = "terraform-tf-state-dbo01"
  force_destroy = true

}
