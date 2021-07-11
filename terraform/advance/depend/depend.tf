provider "aws" {
        region = "ap-southeast-2"
        shared_credentials_file = "/home/hugo/.aws/credentials"
        profile = "testing"
}

resource "aws_instance" "DB" {
        ami = "ami-0c9fe0dec6325a30c"
        instance_type = "t2.micro"

}

resource "aws_instance" "Web" {
        ami = "ami-0c9fe0dec6325a30c"
        instance_type = "t2.micro"
	depends_on = [aws_instance.DB]

}

