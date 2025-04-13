resource "aws_instance" "instance1" {
  ami           = var.ami
  instance_type = var.i-type
  key_name = var.key
#  count = var.c-1 
  subnet_id =   var.subnet1 # us-east-1f

   user_data = <<EOF
    #!/bin/bash
    sudo apt update
    sudo apt-get install nginx -y
    sudo system start nginx
    echo "<h1>welcome to Academy page .... !!</h1>" >> /var/www/html/index.html
  EOF

  tags = {
    Name = "Shrushti"
    Project = "Gulbarga"
    Env = var.env-tag
  }
}

resource "aws_ebs_volume" "volm1" {
  availability_zone = var.az-v1
  size              = var.size-v1
type = var.vol-type
  tags = {
    Name = "volume1"
  }
}

resource "aws_volume_attachment" "ebs_att" {
  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.volm1.id
  instance_id = aws_instance.instance1.id
}

resource "aws_security_group" "mysg" {
  name   = "shrushti"
  vpc_id = var.sg-vpcid

  ingress  {
    from_port        = 22
    to_port          = 22
    protocol         = "TCP"
    cidr_blocks      = ["172.31.64.0/20"]
  }
  egress {
     from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

}

resource "aws_network_interface_sg_attachment" "sg_attachment" {
  security_group_id    = aws_security_group.mysg.id
  network_interface_id = aws_instance.instance1.primary_network_interface_id
}