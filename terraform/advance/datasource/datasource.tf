provider "aws" {
        region = "ap-southeast-2"
        shared_credentials_file = "/home/hugo/.aws/credentials"
        profile = "testing"
}

data "aws_instance" "existedEC2" {
	filter {
		name = "availability-zone"
		values = ["ap-southeast-2a"]
	}
}



resource "aws_instance" "myNewEC2"{
        ami = data.aws_instance.existedEC2.ami
        instance_type = data.aws_instance.existedEC2.instance_type
        

}

data "aws_instances" "newExistedEC2"{
	depends_on = [aws_instance.myNewEC2]
	filter {
        	name = "availability-zone"
                values = ["ap-southeast-2*"]
        }

}

output "newServers" {
	value = aws_instance.myNewEC2.id 
}

output "currentServers"{
	value = data.aws_instances.newExistedEC2.ids
}

output "test"{
	#value    = length(data.aws_instances.newExistedEC2.ids)
	
	value    = data.aws_instances.newExistedEC2.ids[length(data.aws_instances.newExistedEC2.ids)-1]

}
