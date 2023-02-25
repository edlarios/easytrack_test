resource "aws_vpc" "easytr-vpc" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"
  tags = {
    Name = "easytrprod-vpc"
  }
}

data "aws_availability_zones" "available" {}

resource "aws_subnet" "easytr-subnet-public-1" {
  vpc_id                  = aws_vpc.easytr-vpc.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = "true" // asignarles una ip publica
  availability_zone       = data.aws_availability_zones.available.names[0]
  tags = {
    Name = "easytr-subnet-public-1"
  }
}
