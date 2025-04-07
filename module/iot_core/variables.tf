variable "device_name" {
  description = "The name of the IoT device"
  type        = string
}

variable "mqtt_topic" {
  description = "The MQTT topic to subscribe to"
  type        = string
}

variable "firehose_name" {
  description = "The Firehose stream name"
  type        = string
}

variable "firehose_role_arn" {
  description = "The IAM role ARN for Firehose"
  type        = string
}

variable "device_certificate_arn" {
  description = "The ARN of the IoT device certificate"
  type        = string
}
