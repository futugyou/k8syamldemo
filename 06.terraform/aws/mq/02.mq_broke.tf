resource "aws_mq_broker" "mq_broker" {
  broker_name = var.mq_name

  configuration {
    id       = aws_mq_configuration.mq_configuration.id
    revision = aws_mq_configuration.mq_configuration.latest_revision
  }

  engine_type        = "ActiveMQ"
  engine_version     = var.mq_version
  host_instance_type = "mq.t2.micro"

  user {
    username = "ExampleUser"
    password = "MindTheGap"
  }
}
