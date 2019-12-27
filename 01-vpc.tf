# Internet VPC
resource "aws_vpc" "ecs" {
  cidr_block           = "10.0.0.0/16"
  instance_tenancy     = "default"
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"
  enable_classiclink   = "false"
  tags = {
    Name = "ECS"
  }
}

# Subnets
resource "aws_subnet" "main-ecs-1" {
  vpc_id                  = aws_vpc.ecs.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = "${var.AWS_REGION}a"

  tags = {
    Name = "ecs-public-1"
  }
}

resource "aws_subnet" "main-ecs-2" {
  vpc_id                  = aws_vpc.ecs.id
  cidr_block              = "10.0.2.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = "${var.AWS_REGION}b"

  tags = {
    Name = "ecs-public-2"
  }
}