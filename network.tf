resource "aws_internet_gateway" "easytr-igw" {
  vpc_id = aws_vpc.easytr-vpc.id
  tags = {
    Name = "prod-easytr-igw"
  }
}
//creacion tabla de ruteo a mi vpc 
resource "aws_route_table" "easytr-public-crt" {
  vpc_id = aws_vpc.easytr-vpc.id

  route {
    //ips que pueden llegar al VPC por internet
    cidr_block = "0.0.0.0/0"
    //CRT uses this IGW to reach internet
    gateway_id = aws_internet_gateway.easytr-igw.id
  }

  tags = {
    Name = "easytr-public-crt"
  }
}

resource "aws_route_table_association" "easytr-subnet-public-1" {
  subnet_id      = aws_subnet.easytr-subnet-public-1.id
  route_table_id = aws_route_table.easytr-public-crt.id
}

resource "aws_security_group" "ssh-ingress" {
  vpc_id = aws_vpc.easytr-vpc.id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }
  //permitir puerto 22 para ssh
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  //permitir puerto 80
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "ssh-ingress"
  }
}
