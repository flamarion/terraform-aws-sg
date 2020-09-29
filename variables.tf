variable "name" {
  description = "Security Group Name"
  type        = string
  default     = "sg"
}

variable "description" {
  description = "Security Group Description"
  type        = string
  default     = "Security Group"
}

variable "vpc_id" {
  description = "VPC id"
  type        = string
}

variable "sg_tags" {
  description = "Security Group tag map"
  type        = map(string)
  default     = {}
}

variable "sg_rules_cidr" {
  description = "Security group rules"
  type = map(object({
    description       = string
    type              = string
    from_port         = number
    to_port           = number
    cidr_blocks       = list(string)
    protocol          = string
    security_group_id = string
  }))
  default = {}
  # default = {
  #   ssh = {
  #     description       = "Terraform Cloud application via HTTP"
  #     type              = "ingress"
  #     cidr_blocks       = ["0.0.0.0/0"]
  #     from_port         = 0
  #     to_port           = 0
  #     protocol          = -1
  #     security_group_id = "default"
  #   }
  # }
}

variable "sg_rules_sgid" {
  description = "Security group rules"
  type = map(object({
    description              = string
    type                     = string
    from_port                = number
    to_port                  = number
    source_security_group_id = string
    protocol                 = string
    security_group_id        = string
  }))
  default = {}
  # default = {
  #   ssh = {
  #     description              = "Terraform Cloud application via HTTP"
  #     type                     = "ingress"
  #     source_security_group_id = "default"
  #     from_port                = 0
  #     to_port                  = 0
  #     protocol                 = -1
  #     security_group_id        = "default"
  #   }
  # }
}
