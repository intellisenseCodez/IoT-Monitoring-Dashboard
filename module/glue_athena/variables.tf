variable "athena_database" {
  description = "Name of the Athena database"
  type        = string
}

variable "athena_results_bucket" {
  description = "S3 bucket for Athena query results"
  type        = string
}

variable "s3_data_path" {
  description = "S3 path where IoT data lands"
  type        = string
}

variable "glue_role_arn" {
  description = "IAM Role ARN for Glue crawler"
  type        = string
}

variable "table_prefix" {
  description = "Prefix for Glue tables"
  type        = string
}
