# This module configures AWS Glue to crawl the data stored in S3 and create tables in Athena for querying.

resource "aws_athena_database" "iot_db" {
  name   = var.athena_database
  bucket = var.athena_results_bucket
}

resource "aws_glue_crawler" "iot_crawler" {
  name          = "iot-energy-crawler"
  role          = var.glue_role_arn
  database_name = aws_athena_database.iot_db.name
  table_prefix  = var.table_prefix

  s3_target {
    path = var.s3_data_path
  }

  schedule = "cron(0/15 * * * ? *)" # Every 15 mins
}
