terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.72.0"
    }
  }
}
provider "aws" {
  region = var.region
  profile = "crmnext-aws"
}

//Modify the bucket and dynamoDB table that are used by Terraform
# terraform {
#   backend "s3" {
#     bucket         = "DOC-EXAMPLE-BUCKET"
#     key            = "private-windows-eks.tfstate"
#     region         = "eu-central-1"
#     dynamodb_table = "private-windows-eks-tf-lock"
#   }
# }

# data terraform_remote_state "network" {
#     backend = "s3"
#     config = {
#         bucket = "DOC-EXAMPLE-BUCKET"
#         key = "network.tfstate"
#         region = "eu-central-1"
#      }
# }

module "cluster" {
    source = "./eks/cluster"
    region = var.region
    eks_cluster_name = var.eks_cluster_name
    eks_cluster_version = var.eks_cluster_version 
    private_subnet_ids = ["subnet-0d4c553484cf351dc","subnet-0785f9c9b8dd3b94a","subnet-0b8c3a66dd7948288"]
    vpc_id = "vpc-0ceec974fe95ade29"
    bastion_host_SG_id = "sg-058c0663ea1adca8c"
    lin_desired_size = var.lin_desired_size
    lin_max_size = var.lin_max_size
    lin_min_size = var.lin_min_size
    lin_instance_type = var.lin_instance_type
    win_desired_size = var.win_desired_size
    win_max_size = var.win_max_size
    win_min_size = var.win_min_size
    win_instance_type = var.win_instance_type
    node_host_key_name = var.node_host_key_name
}


