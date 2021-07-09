provider "aws" {
        region = "ap-southeast-2"
}

module "ec2module" {
	source = "./ec2"

}

output "ec2Output" {
	#value = module.ec2module.aws_instance.myEC2.id
	value = module.ec2module.InstanceOutput
}
