// Create EC2 Instances
resource "aws_instance" "easytr-machine" {
  //Crea dos instancias de EC2
  count = 2

  // Busca las variables en el archivo variables.tf
  ami                    = lookup(var.ec2_ami, var.aws_region)
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.easytr-subnet-public-1.id
  key_name               = "easytrack-test-key"
  vpc_security_group_ids = [aws_security_group.ssh-ingress.id]
  tags = {
    //permite poner las etiquetas a la maquina
    Name = "easytr-machine-${count.index}"
  }

  }

resource "aws_key_pair" "easytrack-test-key" {
  key_name   = "easytrack-test-key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCJiTZsgk52+F6GEwS0+GyCMliww4vfFBV9Ub2pA0eBOwVAdB+R3cOVZXoEvU5+4ll4/uqSOqLXsYQgAdZy9VySv5BfkPfNbzNkGjzQ8Wz/66oPf4R7gvy8+IM49WOxqKHpG8KF6mxlHEO34zgy2HoJpY6WHtVEMetbZbw+7xV+zDc0dyhtYBwyqKHKWEfg6yZqXcyNQZNjYHrvLhXiLrczbo0mkizfEjo9fpakeU8hgScjZgLNw8p8+16rTcFutMcE8qpm6ZBafjG3Vyn4KjxQZZSvCLE+vaPla48ysDpGBPnRSQHOe4SyvvkMOn3h/ltdXtx5qIuUbr5tgcTAyi8h test@labserver"
}

