output "firehose_role_arn" {
  value = aws_iam_role.firehose_role.arn
}

output "glue_role_arn" {
  description = "The ARN of the IAM role for Glue"
  value       = aws_iam_role.glue_role.arn  # Ensure this is the correct resource name
}
