output "delivery_stream_arn" {
  value = aws_kinesis_firehose_delivery_stream.iot_stream.arn
}

output "delivery_stream_name" {
  value = aws_kinesis_firehose_delivery_stream.iot_stream.name
}

output "firehose_role_arn" {
  description = "The ARN of the IAM role for Firehose"
  value       = aws_iam_role.firehose_role.arn  # Ensure this is the correct resource name
}
