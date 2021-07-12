provider "aws" {
        region = var.region
        shared_credentials_file = "/home/hugo/.aws/credentials"
        profile = "testing"
}

locals{
	instance_name = "${terraform.workspace}-instance"

}

resource "aws_instance" "web" {
	ami = var.ami
	instance_type = var.instance_type

	tags = {
		Name = local.instance_name
	}

}

