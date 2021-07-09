provider "aws" {
        region = "ap-southeast-2"
        shared_credentials_file = "/home/hugo/.aws/credentials"
        profile = "testing"
}

resource "aws_instance" "EC2" {
        ami = "ami-0c9fe0dec6325a30c"
        instance_type = "t2.micro"

}


resource "aws_eip" "myEIP" {
        instance = aws_instance.EC2.id
}


output myOutEIP {
        value = aws_eip.myEIP.public_ip
}

resource "aws_instance" "EC2" {
        ami = "ami-0c9fe0dec6325a30c"
        instance_type = "t2.micro"
        security_groups = [aws_security_group.mySG.name]
}


resource "aws_security_group" "mySG" {
        name = "Allow HTTPS"
        
        ingress{
                description = "Allow HTTPS from anywhere"
                from_port = 443 #range from
                to_port = 443
                protocol = "tcp"
                cidr_blocks = ["0.0.0.0/0"]
                
        }

        egress{
                description = "Allow HTTPS from anywhere"
                from_port = 443 #range from
                to_port = 443
                protocol = "tcp"
                cidr_blocks = ["0.0.0.0/0"]
                
        }

}

