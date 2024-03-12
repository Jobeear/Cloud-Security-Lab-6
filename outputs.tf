output "instance_id" {
  description = "The ID of the created EC2 instance"
  value       = aws_instance.my_ec2_instance.id
}

output "role_name" {
  description = "The name of the created IAM role"
  value       = aws_iam_role.my_role.name
}

output "policy_name" {
  description = "The name of the created IAM policy"
  value       = aws_iam_policy.my_policy.name
}
