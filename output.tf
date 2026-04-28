output "vpc_id"{
    description = "Id da VPC"
    value = aws_vpc.terraform_vpc.id
}