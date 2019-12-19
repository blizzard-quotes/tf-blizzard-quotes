resource "aws_s3_bucket" "swagger" {
  bucket = var.s3_swagger_bucket

  force_destroy = true

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

  website {
    index_document = "index.html"
    error_document = "index.html"
  }

  logging {
    target_bucket = var.s3_logs_bucket
    target_prefix = "s3-access-logs-${var.s3_swagger_bucket}/"
  }

  tags = {
    Name    = var.s3_swagger_bucket
    Purpose = "To make the ${var.game} api specification available."
  }
}

resource "aws_s3_bucket_policy" "associate_policy" {
  bucket = aws_s3_bucket.swagger.id
  policy = data.aws_iam_policy_document.swagger.json
}
