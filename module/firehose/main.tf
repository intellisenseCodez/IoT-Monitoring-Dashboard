# This sets up a Kinesis Firehose delivery stream, which is responsible for ingesting 
# data from the IoT Core service and delivering it to the S3 bucket.

resource "aws_iam_role" "firehose_role" {
  name               = "firehose-delivery-role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Principal = {
          Service = "firehose.amazonaws.com"
        }
        Effect = "Allow"
        Sid    = ""
      },
    ]
  })

  tags = {
    Name = "firehose-delivery-role"
  }
}


resource "aws_kinesis_firehose_delivery_stream" "iot_stream" {
  name        = var.delivery_stream_name
  destination = "extended_s3"

  extended_s3_configuration {
    role_arn           = var.firehose_role_arn
    bucket_arn         = var.s3_bucket_arn

    buffering_size = 64
    
    compression_format = "UNCOMPRESSED"

  }
}
