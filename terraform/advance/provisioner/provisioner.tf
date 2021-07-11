provider "aws" {
        region = "ap-southeast-2"
        shared_credentials_file = "/home/hugo/.aws/credentials"
        profile = "testing"
}

resource "aws_instance" "myEC2"{
        ami = "ami-0c9fe0dec6325a30c"
        instance_type = "t2.micro"
	key_name = "tf_test"
	
	/*
	provisioner "local-exec" {
		#command = "echo ${aws_instance.myEC2.private_ip} >> private_ip.txt"
		command = "echo ${self.private_ip} >> private_ip.txt"
	}
	*/

	/*
	provisioner "remote-exec"{
		inline = [
			"sudo amazon-linux-extras install -y nginx1",
			"sudo systemctl start nginx",
		]
		
		connection{
			type = "ssh"
			user = "ec2-user"
			private_key = file("~/.aws/tf_test.pem")
			host = self.public_ip

		}
		
	}
	*/
	provisioner "local-exec" {
                #command = "echo ${aws_instance.myEC2.private_ip} >> private_ip.txt"
                command = "echo ${self.private_ip} >> private_ip.txt"
        }

	/*connection{
                        type = "ssh"
                        user = "ec2-user"
                        private_key = file("~/.aws/tf_test.pem")
                        host = self.public_ip

                }
	*/
	provisioner "file" {
		#content = "test content"
		source = "/tmp/script.sh"
		destination = "/home/ec2-user/test.txt"
		connection{
                        type = "ssh"
                        user = "ec2-user"
                        private_key = file("~/.aws/tf_test.pem")
                        host = self.public_ip

                }

	
	}




}

output "ip" {
	value = aws_instance.myEC2.public_ip
}
