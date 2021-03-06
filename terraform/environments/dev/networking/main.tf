terraform {
  backend "s3" {
    bucket = "kitchenhelper-tfstate"
    key    = "dev/terraform.tfstate"
    region = "eu-west-1"
  }
}


provider "aws" {
  region = var.region
}

module "network" {
  source = "../../../modules/networking"

  environment_name = var.name
  vpc_cidr         = var.vpc_cidr
  azs              = var.azs
  private_cidrs    = var.private_cidrs
  cidrs            = var.cidrs
}
