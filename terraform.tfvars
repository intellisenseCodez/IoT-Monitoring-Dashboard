# S3 Bucket Configuration
bucket_name           = "iot-energy-data"
s3_bucket_arn         = "arn:aws:s3:::iot-energy-data"

# IAM Role ARN for Firehose and Glue
firehose_role_arn     = "arn:aws:iam::123456789012:role/firehose_delivery_role"
glue_role_arn         = "arn:aws:iam::123456789012:role/glue_service_role"

# Firehose Stream Configuration
delivery_stream_name  = "iot-firehose-stream"

# IoT Core Device Configuration
device_name           = "iot-energy-meter"
mqtt_topic            = "iot/energy"
device_certificate_arn = "arn:aws:iot:us-west-2:123456789012:cert/abc123"  # Replace with actual ARN

# Glue & Athena Configuration
athena_database       = "iot_data"
athena_results_bucket = "iot-athena-results"
table_prefix          = "iot_"
s3_data_path          = "s3://iot-energy-data"

# QuickSight Configuration
email                 = "admin@example.com"
username              = "admin_user"

