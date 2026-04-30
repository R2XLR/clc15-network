## Requirements

| Name | Version |
| ---- | ------- |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | 6.42.0 |

## Providers

| Name | Version |
| ---- | ------- |
| <a name="provider_aws"></a> [aws](#provider\_aws) | 6.42.0 |

## Modules

No modules.

## Resources

| Name | Type |
| ---- | ---- |
| [aws_default_security_group.default](https://registry.terraform.io/providers/hashicorp/aws/6.42.0/docs/resources/default_security_group) | resource |
| [aws_eip.tf_ip_nat_1a](https://registry.terraform.io/providers/hashicorp/aws/6.42.0/docs/resources/eip) | resource |
| [aws_eip.tf_ip_nat_1b](https://registry.terraform.io/providers/hashicorp/aws/6.42.0/docs/resources/eip) | resource |
| [aws_flow_log.example](https://registry.terraform.io/providers/hashicorp/aws/6.42.0/docs/resources/flow_log) | resource |
| [aws_internet_gateway.tf_igw](https://registry.terraform.io/providers/hashicorp/aws/6.42.0/docs/resources/internet_gateway) | resource |
| [aws_nat_gateway.tf_natgateway_1a](https://registry.terraform.io/providers/hashicorp/aws/6.42.0/docs/resources/nat_gateway) | resource |
| [aws_nat_gateway.tf_natgateway_1b](https://registry.terraform.io/providers/hashicorp/aws/6.42.0/docs/resources/nat_gateway) | resource |
| [aws_route_table.tf_private_rt_1a](https://registry.terraform.io/providers/hashicorp/aws/6.42.0/docs/resources/route_table) | resource |
| [aws_route_table.tf_private_rt_1b](https://registry.terraform.io/providers/hashicorp/aws/6.42.0/docs/resources/route_table) | resource |
| [aws_route_table.tf_public_rt](https://registry.terraform.io/providers/hashicorp/aws/6.42.0/docs/resources/route_table) | resource |
| [aws_route_table_association.private_1a_association](https://registry.terraform.io/providers/hashicorp/aws/6.42.0/docs/resources/route_table_association) | resource |
| [aws_route_table_association.private_1b_association](https://registry.terraform.io/providers/hashicorp/aws/6.42.0/docs/resources/route_table_association) | resource |
| [aws_route_table_association.public-1A-association](https://registry.terraform.io/providers/hashicorp/aws/6.42.0/docs/resources/route_table_association) | resource |
| [aws_route_table_association.public-1B-association](https://registry.terraform.io/providers/hashicorp/aws/6.42.0/docs/resources/route_table_association) | resource |
| [aws_subnet.subnet_private_1a](https://registry.terraform.io/providers/hashicorp/aws/6.42.0/docs/resources/subnet) | resource |
| [aws_subnet.subnet_private_1b](https://registry.terraform.io/providers/hashicorp/aws/6.42.0/docs/resources/subnet) | resource |
| [aws_subnet.subnet_public_1a](https://registry.terraform.io/providers/hashicorp/aws/6.42.0/docs/resources/subnet) | resource |
| [aws_subnet.subnet_public_1b](https://registry.terraform.io/providers/hashicorp/aws/6.42.0/docs/resources/subnet) | resource |
| [aws_vpc.terraform_vpc](https://registry.terraform.io/providers/hashicorp/aws/6.42.0/docs/resources/vpc) | resource |

## Inputs

No inputs.

## Outputs

| Name | Description |
| ---- | ----------- |
| <a name="output_vpc_id"></a> [vpc\_id](#output\_vpc\_id) | Id da VPC |
