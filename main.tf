## VPC
## Cria a VPC
resource "aws_vpc" "terraform_vpc" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "clc15-tf-vpc"
    CC = "123456"
    Owner = "devops"
  }
}

# Correcao primeira issue
resource "aws_flow_log" "example" {
  log_destination      = "arn:aws:s3:::clc15-victorqueiroz-terraform"
  log_destination_type = "s3"
  traffic_type         = "ALL"
  vpc_id               = aws_vpc.terraform_vpc.id
}

# Correcao segunda issue
resource "aws_default_security_group" "default" {
  vpc_id = aws_vpc.terraform_vpc.id
  
  tags = {
    Name = "my-iac-sg"
  }
}


## SUBNETS
## Cria 2 subnets 1A
resource "aws_subnet" "subnet_public_1a" {
  vpc_id     = aws_vpc.terraform_vpc.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "subnet_public_1a"
  }
}

resource "aws_subnet" "subnet_private_1a" {
  vpc_id     = aws_vpc.terraform_vpc.id
  cidr_block = "10.0.100.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "subnet_private_1a"
  }
}


## Cria 2 subnets 1B
resource "aws_subnet" "subnet_public_1b" {
  vpc_id     = aws_vpc.terraform_vpc.id
  cidr_block = "10.0.2.0/24"
  availability_zone = "us-east-1b"

  tags = {
    Name = "subnet_public_1b"
  }
}

resource "aws_subnet" "subnet_private_1b" {
  vpc_id     = aws_vpc.terraform_vpc.id
  cidr_block = "10.0.200.0/24"
  availability_zone = "us-east-1b"

  tags = {
    Name = "subnet_private_1b"
  }
}


## SUBNETS
## Cria o Internet Gateway para a VPC
resource "aws_internet_gateway" "tf_igw" {
  vpc_id = aws_vpc.terraform_vpc.id

  tags = {
    Name = "tf_igw"
  }
}


## ROUTE TABLE
## Cria a tabela de rota publica apontando para o internet gateway
resource "aws_route_table" "tf_public_rt" {
  vpc_id = aws_vpc.terraform_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.tf_igw.id
  }

  tags = {
    Name = "tf-public-rt"
  }
}


## ASSOCIACAO DAS ROUTE TABLES 
## Associa a RT Publica nas subnets publicas
resource "aws_route_table_association" "public-1A-association" {
  subnet_id      = aws_subnet.subnet_public_1a.id
  route_table_id = aws_route_table.tf_public_rt.id
}

resource "aws_route_table_association" "public-1B-association" {
  subnet_id      = aws_subnet.subnet_public_1b.id
  route_table_id = aws_route_table.tf_public_rt.id
}


## ELASTIC IP
## Cria Elastic IPs para as NATs
resource "aws_eip" "tf_ip_nat_1a" {
  domain   = "vpc"
}

resource "aws_eip" "tf_ip_nat_1b" {
  domain   = "vpc"
}


## NAT GATEWAYS
## Cria das NATs em suas respectivas subnets publics
resource "aws_nat_gateway" "tf_natgateway_1a" {
  allocation_id = aws_eip.tf_ip_nat_1a.id
  subnet_id     = aws_subnet.subnet_public_1a.id

  tags = {
    Name = "tf_natgw_1a"
  }

  depends_on = [aws_internet_gateway.tf_igw]
}

resource "aws_nat_gateway" "tf_natgateway_1b" {
  allocation_id = aws_eip.tf_ip_nat_1b.id
  subnet_id     = aws_subnet.subnet_public_1b.id

  tags = {
    Name = "tf_natgw_1b"
  }

  depends_on = [aws_internet_gateway.tf_igw]
}


## PRIVATE ROUTE TABLE
## Cria tabela de rotas privadas para subnets 1A e 1B
resource "aws_route_table" "tf_private_rt_1a" {
  vpc_id = aws_vpc.terraform_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.tf_natgateway_1a.id
  }

  tags = {
    Name = "tf-private-rt-1a"
  }
}

resource "aws_route_table" "tf_private_rt_1b" {
  vpc_id = aws_vpc.terraform_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.tf_natgateway_1b.id
  }

  tags = {
    Name = "tf-private-rt-1b"
  }
}


## ASSOCIACAO DAS ROUTE TABLES PRIVADAS
## Associa a RT Privadas nas subnets privadas
resource "aws_route_table_association" "private_1a_association" {
  subnet_id      = aws_subnet.subnet_private_1a.id
  route_table_id = aws_route_table.tf_private_rt_1a.id
}

resource "aws_route_table_association" "private_1b_association" {
  subnet_id      = aws_subnet.subnet_private_1b.id
  route_table_id = aws_route_table.tf_private_rt_1b.id
}