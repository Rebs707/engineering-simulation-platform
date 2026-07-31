output "log_group_name" {
  description = "CloudWatch Log Group name."
  value       = aws_cloudwatch_log_group.this.name
}

output "alarm_name" {
  description = "CloudWatch Alarm name."
  value       = aws_cloudwatch_metric_alarm.cpu.alarm_name
}
