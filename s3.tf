resource "aws_s3_bucket" "blizzard_quotes_logs" {
  bucket = local.s3_bucket_logs_name
  acl    = "log-delivery-write"

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

  lifecycle_rule {
    id      = "logs-lifecycle"
    enabled = true

    transition {
      days          = 30
      storage_class = "STANDARD_IA"
    }

    expiration {
      days = 90
    }
  }

  logging {
    target_bucket = local.s3_bucket_logs_name
    target_prefix = "s3-access-logs-${local.s3_bucket_logs_name}/"
  }

  policy = module.secure_transport_policy_logs.json

  tags = {
    Name    = local.s3_bucket_logs_name
    Purpose = "To house logs inside the blizzard-quotes environment."
    Repo    = "None"
  }
}
