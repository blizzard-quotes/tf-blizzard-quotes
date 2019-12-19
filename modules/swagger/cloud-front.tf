resource "aws_cloudfront_origin_access_identity" "swagger" {
  comment = "Origin Access Identity for ${var.hostname}"
}

resource "aws_cloudfront_distribution" "swagger" {
  origin {
    domain_name = aws_s3_bucket.swagger.bucket_regional_domain_name
    origin_id   = aws_s3_bucket.swagger.bucket

    s3_origin_config {
      origin_access_identity = aws_cloudfront_origin_access_identity.swagger.cloudfront_access_identity_path
    }
  }

  aliases = ["${var.hostname}"]

  enabled             = true
  is_ipv6_enabled     = true
  comment             = "CloudFront distribution for hosting ${var.hostname}"
  default_root_object = "index.html"

  price_class = "PriceClass_100"

  logging_config {
    include_cookies = false
    bucket          = "${var.s3_logs_bucket}.s3.amazonaws.com"
    prefix          = "cloud-front-${var.game}-swagger/"
  }

  default_cache_behavior {
    allowed_methods  = ["GET", "HEAD", "OPTIONS"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = aws_s3_bucket.swagger.bucket

    forwarded_values {
      query_string = false

      cookies {
        forward = "none"
      }
    }

    viewer_protocol_policy = "redirect-to-https"
    min_ttl                = 0
    default_ttl            = 3600
    max_ttl                = 86400
  }

  custom_error_response {
    error_caching_min_ttl = 5
    error_code            = 404
    response_page_path    = "/index.html"
    response_code         = 200
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  viewer_certificate {
    acm_certificate_arn = var.acm_certificate_arn
    ssl_support_method  = "sni-only"
  }

  tags = {
    Name    = var.hostname
    Purpose = "CloudFront distribution for hosting ${var.hostname}"
  }
}
