# This module represents the IoT Core service, 
# which connects to your devices (IoT devices) and subscribes to an MQTT topic (iot/energy).

resource "aws_iot_thing" "iot_device" {
  name = var.device_name
}

resource "aws_iot_topic_rule" "iot_rule" {
  name = "iot_to_firehose_rule"
  enabled = true

  sql = "SELECT * FROM '${var.mqtt_topic}'"
  sql_version = "2016-03-23"


  error_action {
    firehose {
      delivery_stream_name = var.firehose_name
      role_arn             = var.firehose_role_arn
    }
  }
}

resource "aws_iot_thing_principal_attachment" "thing_attachment" {
  thing = aws_iot_thing.iot_device.name
  principal  = var.device_certificate_arn
}
