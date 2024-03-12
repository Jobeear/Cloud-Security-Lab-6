variable "region" {
  description = "The AWS region where resources will be created"
  default     = "us-east-1"
}

variable "ami" {
  description = "The AMI ID for the EC2 instance"
  default     = "ami-07d9b9ddc6cd8dd30" # Ubuntu Server 22.04 LTS (HVM), SSD Volume Type, (64-bit (x86))
}

variable "instance_type" {
  description = "The EC2 instance type"
  default     = "t2.micro" # instance type
}

variable "role_name" {
  description = "The name of the IAM role"
  default     = "john-n01609389-role" # role name
}

variable "policy_name" {
  description = "The name of the IAM policy"
  default     = "john-n01609389-policy" # policy name
}
