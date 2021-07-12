variable "region_dev" {
	default = "ap-southeast-2"
}

variable "region_prod" {
        default = "ap-southeast-1"
}

variable "vpcname_dev" {
	default = "vpc-dev"
}

variable "vpcname_prod" {
        default = "vpc-prod"
}




provider "aws" {
        region = "${terraform.workspace == "dev" ? var.region_dev : var.region_prod}"
        shared_credentials_file = "/home/hugo/.aws/credentials"
        profile = "testing"
}

locals{
	instance_name = "${terraform.workspace}-instance"

}


resource "aws_vpc" "myvpc"{
    cidr_block = "10.0.0.0/16"

	tags = {
		name = "${terraform.workspace == "dev" ? var.vpcname_dev : var.vpcname_prod}"
	}
}

