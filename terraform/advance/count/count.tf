provider "aws" {
        region = "ap-southeast-2"
        shared_credentials_file = "/home/hugo/.aws/credentials"
        profile = "testing"
}

resource "aws_instance" "myEC2"{
        ami = "ami-0c9fe0dec6325a30c"
        instance_type = "t2.micro"
        count = 3

}
