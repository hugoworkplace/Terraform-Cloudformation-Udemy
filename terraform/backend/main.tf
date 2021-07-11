provider "aws" {
        region = "ap-southeast-2"
        shared_credentials_file = "/home/hugo/.aws/credentials"
        profile = "testing"
}

resource "aws_vpc" "backendVPC" {
	cidr_block = "10.0.0.0/16"
}
