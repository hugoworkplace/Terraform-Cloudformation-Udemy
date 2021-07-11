terraform {
	backend "s3" {
		key = "terraform/tfstate.tfstate"
		bucket = "terraform-files-udemy"
	        region = "ap-southeast-2"
	        shared_credentials_file = "/home/hugo/.aws/credentials"
        	profile = "testing"


	}



}
