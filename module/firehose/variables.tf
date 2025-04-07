variable "delivery_stream_name" {
  description = "The name of the Kinesis Firehose stream"
  type        = string
}

variable "s3_bucket_arn" {
  description = "The ARN of the S3 bucket to deliver to"
  type        = string
}

variable "firehose_role_arn" {
  description = "The ARN of the IAM role for Firehose"
  type        = string
}
