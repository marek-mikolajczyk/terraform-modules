provider "aws" {
	region = "us-east-1"
}


resource "aws_instance" "instance-ec2" {

	
	ami = "ami-042e8287309f5df03"
	instance_type = "t2.micro"
	vpc_security_group_ids = [aws_security_group.instance-sg.id]

	user_data = <<-EOF
		#!/bin/bash
		echo "Hello, World ${var.server_env}" > index.html
		nohup busybox httpd -f -p ${var.server_port} &
		EOF

tags = {
		Name = "${var.server_name}-${var.server_env}"
		Environment = var.server_env
		PlatformType = "test"
	}


}

resource "aws_security_group" "instance-sg" {
	name = "sg-${var.server_name}-${var.server_env}"
	ingress {
		from_port = var.server_port
		to_port = var.server_port
		protocol = "tcp"
		cidr_blocks = ["0.0.0.0/0"]
	}
}
