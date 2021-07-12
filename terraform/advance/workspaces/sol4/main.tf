variable "region" {
	type = map
	default = {
		dev = "ap-southeast-2"
		prod = "ap-southeast-1"
	}
}


variable "vpcname" {
        type = map
        default = {
                dev = "dev-vpc"
                prod = "prod-vpc"
        }       
}



provider "aws" {
        region = var.region[terraform.workspace]
        shared_credentials_file = "/home/hugo/.aws/credentials"
        profile = "testing"
}

locals{
	instance_name = "${terraform.workspace}-instance"

}


resource "aws_vpc" "myvpc"{
    cidr_block = "10.0.0.0/16"

	tags = {
		name = var.vpcname[terraform.workspace]
	}
}

