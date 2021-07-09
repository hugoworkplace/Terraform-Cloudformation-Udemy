variable "myStrVar" {
	type = string
	default = "my-frist-vpc"

}

variable "myNumVar"{
	type = number
	default = 100
}

variable "myBoolVar" {
	default = true

}

variable "myListVar"{
	type = list(number)
	default = [10,20]

}

variable "myStrList"{
	type = list(string)
	default = ["apple","orange"]
}

variable "myMapVar"{
	type = map
	default = {
		Key1 = "value1"
		Key2 = "value2"


	}
}

variable "myInputVar" {
	type = string
	description = "Please enter a vpc name"
}

variable "myTupleVar" {
	type = tuple([string,number,string])
	default = ["str1",10,"str2"]

}

variable "myObject"{
	type = object({name = string, port = list(number)})
	default = {
		name = "myports"
		port = [22, 80, 443]
	
	}
}



provider "aws"{
    region = "ap-southeast-2"
    shared_credentials_file = "/home/hugo/.aws/credentials"
    profile = "testing"
}


resource "aws_vpc" "myVPC" {
	#cidr_block = "10.10.10.0/24"
	cidr_block = "10.0.0.0/16"
	tags = {
		Name = var.myStrVar
		#Name = var.myInputVar
		elem = var.myStrList[0]
		elem_1 = var.myMapVar["Key1"]

	}


}


output "myOutput"{
	value = aws_vpc.myVPC.id


}
