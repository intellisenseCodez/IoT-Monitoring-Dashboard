# Provider
provider "aws" {
  region = "us-west-2"  # AWS region
}

# 🔸 S3 Module - Bucket for Firehose delivery and Glue Crawling
module "s3" {
  source      = "./module/s3"
  bucket_name = "iot-energy-data"  # Unique bucket name
}

# 🔸 IAM Role for Firehose
module "iam" {
  source          = "./module/iam"
  s3_bucket_arn   = module.s3.bucket_arn
}

# 🔸 Kinesis Firehose Module
module "firehose" {
  source           = "./module/firehose"
  delivery_stream_name = "iot-firehose-stream"
  s3_bucket_arn    = module.s3.bucket_arn
  firehose_role_arn = module.iam.firehose_role_arn
}

# 🔸 IoT Core Module - Device and MQTT topic to Firehose
module "iot_core" {
  source            = "./module/iot_core"
  device_name       = "iot-energy-meter"
  mqtt_topic        = "iot/energy"
  firehose_name     = module.firehose.delivery_stream_name
  firehose_role_arn = module.firehose.firehose_role_arn
  device_certificate_arn = "arn:aws:iot:us-west-2:123456789012:cert/c8f584cc98c1345d280eea4621fd7d2aacb57ecb79875233b8e83bd7de86e34a"  # IoT device certificate ARN
}

# 🔸 Glue and Athena Module for querying IoT data
module "glue_athena" {
  source           = "./module/glue_athena"
  athena_database  = "iot_data"
  s3_data_path     = module.s3.bucket_arn
  glue_role_arn    = module.iam.glue_role_arn
  athena_results_bucket = "iot-athena-results"  # Bucket for Athena query results
  table_prefix     = "iot_"
}

# 🔸 QuickSight Module - User and Permissions for Data Visualization
module "quicksight" {
  source   = "./module/quicksight"
  email    = "admin@example.com"
  username = "admin_user"
}

# 🔸 Outputs for easy reference after deployment
output "iot_endpoint" {
  value = module.iot_core.iot_endpoint
}

output "s3_bucket_arn" {
  value = module.s3.bucket_arn
}

output "firehose_stream_arn" {
  value = module.firehose.delivery_stream_arn
}

output "athena_database_name" {
  value = module.glue_athena.athena_database_name
}
