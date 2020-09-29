terraform {
  required_version = "~> 0.12"
}

resource "aws_security_group" "sg" {
  name        = var.name
  description = var.description
  vpc_id      = var.vpc_id
  tags        = var.sg_tags
}

resource "aws_security_group_rule" "cidr_source_rule" {
  for_each                 = var.sg_rules_cidr
  description              = each.value["description"]
  type                     = each.value["type"]
  cidr_blocks              = each.value["cidr_blocks"]
  from_port                = each.value["from_port"]
  to_port                  = each.value["to_port"]
  protocol                 = each.value["protocol"]
  security_group_id        = each.value["security_group_id"]
}

resource "aws_security_group_rule" "sgid_source_rule" {
  for_each                 = var.sg_rules_sgid
  description              = each.value["description"]
  type                     = each.value["type"]
  source_security_group_id = each.value["source_security_group_id"]
  from_port                = each.value["from_port"]
  to_port                  = each.value["to_port"]
  protocol                 = each.value["protocol"]
  security_group_id        = each.value["security_group_id"]
}
