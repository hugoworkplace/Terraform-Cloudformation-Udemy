provider "aws" {
        region = "ap-southeast-2"
        shared_credentials_file = "/home/hugo/.aws/credentials"
        profile = "testing"
}

resource "aws_iam_user" "myuser" {
	name = "test-user"
}

resource "aws_iam_policy" "myPolicy" {
	name = "Test-Custom-Policy"
	policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Action": "ec2:*",
            "Effect": "Allow",
            "Resource": "*"
        },
        {
            "Effect": "Allow",
            "Action": "elasticloadbalancing:*",
            "Resource": "*"
        },
        {
            "Effect": "Allow",
            "Action": "cloudwatch:*",
            "Resource": "*"
        },
        {
            "Effect": "Allow",
            "Action": "autoscaling:*",
            "Resource": "*"
        },
        {
            "Effect": "Allow",
            "Action": "iam:CreateServiceLinkedRole",
            "Resource": "*",
            "Condition": {
                "StringEquals": {
                    "iam:AWSServiceName": [
                        "autoscaling.amazonaws.com",
                        "ec2scheduled.amazonaws.com",
                        "elasticloadbalancing.amazonaws.com",
                        "spot.amazonaws.com",
                        "spotfleet.amazonaws.com",
                        "transitgateway.amazonaws.com"
                    ]
                }
            }
        }
    ]
}
EOF

}

resource "aws_iam_policy_attachment" "attachMyPolicy" {
	name = "attachment"
	users = [aws_iam_user.myuser.name]
	policy_arn = aws_iam_policy.myPolicy.arn
}


