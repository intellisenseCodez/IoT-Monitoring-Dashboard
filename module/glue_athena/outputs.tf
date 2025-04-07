output "athena_database_name" {
  value = aws_athena_database.iot_db.name
}

output "glue_crawler_name" {
  value = aws_glue_crawler.iot_crawler.name
}
