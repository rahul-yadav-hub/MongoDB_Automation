terraform {
  required_providers {
    aws = {
      source         =    "hashicorp/aws"
      version        =    "~> 3.27"
    }
  }

  required_version   =    ">= 0.14.9"
}

// Define provider
provider "aws" {
  profile            =    ""
  region             =    var.region
}


module "mySecurity" { 
  source             =    "./Security Group"
  tag                =    var.tag
  vpc_id             =    var.vpc_id
}

module "EC2-Primary" { 
  source              =     "./EC2"
  public_subnet_id    =     var.public_subnet_id
  sg_id               =     ["${module.mySecurity.MONGOSG}"]
  key_name            =     var.key_name
  ami_id              =     var.ami_id
  instance_type       =     var.instance_type
  tag                 =     "Rahul-Mongo-P"
  script_path         =     var.script_path
}

module "EC2-Secondary1" { 
  source              =     "./EC2"
  public_subnet_id    =     var.public_subnet_id
  sg_id               =     ["${module.mySecurity.MONGOSG}"]
  key_name            =     var.key_name
  ami_id              =     var.ami_id
  instance_type       =     var.instance_type
  tag                 =     "Rahul-Mongo-S1"
  script_path         =     var.script_path
}

module "EC2-Secondary2" { 
  source              =     "./EC2"
  public_subnet_id    =     var.public_subnet_id
  sg_id               =     ["${module.mySecurity.MONGOSG}"]
  key_name            =     var.key_name
  ami_id              =     var.ami_id
  instance_type       =     var.instance_type
  tag                 =     "Rahul-Mongo-S2"
  script_path         =     var.script_path
}