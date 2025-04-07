# This creates an S3 bucket where Firehose will deliver the IoT data.

resource "aws_s3_bucket" "iot_data" {
  bucket = var.bucket_name

  lifecycle {
    prevent_destroy = true
  }
}

resource "aws_s3_bucket_acl" "iot_data_acl" {
  bucket = aws_s3_bucket.iot_data.id
  acl    = "private"
}