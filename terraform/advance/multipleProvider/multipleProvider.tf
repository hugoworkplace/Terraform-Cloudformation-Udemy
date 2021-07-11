provider "aws" {
        region = "ap-southeast-2"
        shared_credentials_file = "/home/hugo/.aws/credentials"
        profile = "testing"
	alias = "sydney"
}

provider "aws"{
        region = "ap-southeast-1"
	shared_credentials_file = "/home/hugo/.aws/credentials"
        profile = "testing"
	alias = "singapore"

}

resource "aws_instance" "myEC2-sy"{
        ami = "ami-0c9fe0dec6325a30c"
        instance_type = "t2.micro"
        provider = aws.sydney

}

resource "aws_instance" "myEC2-sg"{
        ami = "ami-0e5182fad1edfaa68"
        instance_type = "t2.micro"
        provider = aws.singapore

}

