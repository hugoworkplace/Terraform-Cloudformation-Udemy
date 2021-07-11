provider "aws" {
        region = "ap-southeast-2"
        shared_credentials_file = "/home/hugo/.aws/credentials"
        profile = "testing"
}

resource "aws_db_instance" "myRDS" {
  	allocated_storage    = 10
  	engine               = "mysql"
  	engine_version       = "5.7"
  	instance_class       = "db.t3.micro"
  	name                 = "mydb"
  	username             = "foo"
  	password             = "foobarbaz"
  	parameter_group_name = "default.mysql5.7"
  	skip_final_snapshot  = true
	port		     = 3306

}
