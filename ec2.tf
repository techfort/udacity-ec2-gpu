resource "aws_security_group" "jupyter" {
  tags = {
    Name = "jupyter-sg"
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group_rule" "port888" {
  security_group_id = "${aws_security_group.jupyter.id}"
  type = "ingress"
  from_port = 0 
  to_port = 8888
  protocol        = "tcp"
  cidr_blocks     = ["0.0.0.0/0"]
}

resource "aws_instance" "aind_dl_instance" {
  
  ami = "ami-82838de4" // or equivalent in your region
  instance_type = "p2.xlarge"
  vpc_security_group_ids = ["${aws_security_group.jupyter.id}"]
  associate_public_ip_address = true
 
  tags = {
    Name = "aind2-dl-instance"
  }
}

resource "null_resource" "aind2_provisioner" {
  triggers {
    id = "${uuid()}"
  } 
  connection {
    host = "${aws_instance.aind_dl_instance.public_ip}"
    user = "aind2"
    password = "aind2"
    type = "ssh"
    agent = true
  }
  
  
  provisioner "remote-exec" {
    inline = [
      "git clone https://github.com/udacity/aind2-cnn.git",
      "cd aind2-cnn",
      "source activate aind2",
      "jupyter notebook --ip=0.0.0.0 --no-browser"
    ]
  }


}

output "instance_ip" {
  value = "${aws_instance.aind_dl_instance.public_ip}"
}

