resource "aws_cloudwatch_metric_alarm" "billing_alarm_low" {
  alarm_name          = "BillingAlarmLow"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = "1"
  metric_name         = "EstimatedCharges"
  namespace           = "AWS/Billing"
  period              = "300"
  statistic           = "Maximum"
  threshold           = "2"
  alarm_description   = "Alarm to signal that billing is getting high."
  treat_missing_data  = "missing"

  dimensions = {
    Currency = "USD"
  }

  alarm_actions = [aws_sns_topic.cost_notification.arn]
}

resource "aws_cloudwatch_metric_alarm" "billing_alarm_high" {
  alarm_name          = "BillingAlarmHigh"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = "1"
  metric_name         = "EstimatedCharges"
  namespace           = "AWS/Billing"
  period              = "300"
  statistic           = "Maximum"
  threshold           = "20"
  alarm_description   = "Alert to signal that billing is even higher."
  treat_missing_data  = "missing"

  dimensions = {
    Currency = "USD"
  }

  alarm_actions = [aws_sns_topic.cost_notification.arn]
}

