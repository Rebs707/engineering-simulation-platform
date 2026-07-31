# CloudWatch Module

## Purpose

Creates a CloudWatch Log Group and a configurable CloudWatch metric alarm.

## Resources Created

- CloudWatch Log Group
- CloudWatch metric alarm

## Key Inputs

- `log_group_name`
- `retention_in_days`
- `alarm_name`
- `metric_name`
- `namespace`
- `threshold`
- `dimensions`
- `comparison_operator`
- `evaluation_periods`
- `period`
- `tags`

## Example

```hcl
module "cloudwatch" {
  source = "../../modules/cloudwatch"

  log_group_name = "/engineering-simulation/dev"
  alarm_name     = "engineering-simulation-dev-high-cpu"
  metric_name    = "CPUUtilization"
  namespace      = "AWS/EC2"
  threshold      = 80

  dimensions = {
    InstanceId = "i-0123456789abcdef0"
  }
}
```

## Operational Notes

- Alarm dimensions must identify the monitored AWS resource.
- Retention defaults to 30 days.
- Alarm actions can be added later through SNS integration.
