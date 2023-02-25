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
  public_key = var.sample_public_key
}

