# AWS Security Group Module

This module is intended to create a Security Group and Security group rules.


If you need more detailed AWS Security Group I recommend you use the official terraform module for AWS Security Group

https://registry.terraform.io/modules/terraform-aws-modules/security-group/aws/

## Input Variables

|Name|Type|Mandatory|Default Value|Description|
|----|----|---------|-------------|-----------|
|name|string|yes|"sg"|Security Group name|
|description|string|no|"Security Group"|Security Group description|
|vpc_id|string|yes|\"\"|VPC ID where the Security Group will be created|
|sg_tags|map(string)|no|{}|Map of Security Group tags|
|sg_rules_cidr|map(object)|no|{}|Custom object with the Security Group rules with CIDR as source|
|sg_rules_sgid|map(object)|no|{}|Custom object with the Security Group rules with Security Group as source|


## Outputs

The outputs available are the following

|Name|Description|
|----|-----------|
|sg_id|Security Group ID|

## Example

The full example can be found in [Examples](./examples) directory.

## Tests

TODO