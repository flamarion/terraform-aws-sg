provider "aws" {
  version = "~> 2.59"
  region  = "eu-central-1"
}


module "sg" {
  source      = "../"
  name        = "security-group-flama"
  description = "My Security Group"
  vpc_id      = "vpc-01bc8497d48ccad6c"
  sg_rules_cidr = {
    ssh = {
      description       = "Security Group"
      type              = "ingress"
      cidr_blocks       = ["10.0.1.0/24"]
      from_port         = 22
      to_port           = 22
      protocol          = "tcp"
      security_group_id = module.sg.sg_id
    }
  }
  sg_rules_sgid = {
    foo = {
      description              = "Security Group"
      type                     = "ingress"
      source_security_group_id = module.sg.sg_id
      from_port                = 2222
      to_port                  = 2222
      protocol                 = "tcp"
      security_group_id        = module.sg.sg_id
    }
  }
}

output "sg_id" {
  value = module.sg.sg_id
}
