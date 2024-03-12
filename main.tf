# Define AWS provider
provider "aws" {
  region = "us-east-1" # Change to your desired region
}

# Define IAM role
resource "aws_iam_role" "my_role" {
  name               = "john-n01609389-role"
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}

# Define IAM policy document
data "aws_iam_policy_document" "assume_role" {
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      type        = "AWS"
      identifiers = ["arn:aws:iam::058264530243:root"] # AWS root account ARN
    }
  }
}

# Define granular IAM policy
resource "aws_iam_policy" "my_policy" {
  name        = "john-n01609389-policy"
  description = "Policy for Terraform Lab 6"
  policy      = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "ec2:RunInstances", 
        "ec2:DescribeInstances",
        "ec2:TerminateInstances"
      ],
      "Resource": "*"
    }
  ]
}
EOF
}

# Associate policy with the role
resource "aws_iam_role_policy_attachment" "policy_attach" {
  role       = aws_iam_role.my_role.name
  policy_arn = aws_iam_policy.my_policy.arn
}

# Create IAM instance profile
resource "aws_iam_instance_profile" "my_instance_profile" {
  name = "john-n01609389-instance-profile"
  role = aws_iam_role.my_role.name
}

# Create AWS resources using the role and instance profile
resource "aws_instance" "my_ec2_instance" {
  ami                  = "ami-07d9b9ddc6cd8dd30"
  instance_type        = "t2.micro"
  iam_instance_profile = aws_iam_instance_profile.my_instance_profile.name
}
