module "secure_transport_policy_logs" {
  source      = "../iam/secure-transport-policy"
  bucket_name = var.s3_logs_bucket
}

module "secure_transport_policy" {
  source      = "../iam/secure-transport-policy"
  bucket_name = var.s3_swagger_bucket
}

data "aws_iam_policy_document" "swagger" {
  source_json = module.secure_transport_policy.json

  statement {
    sid       = "OriginAccessIdentityGet"
    actions   = ["s3:GetObject"]
    resources = ["${aws_s3_bucket.swagger.arn}/*"]

    principals {
      type        = "AWS"
      identifiers = [aws_cloudfront_origin_access_identity.swagger.iam_arn]
    }
  }

  statement {
    sid       = "OriginAccessIdentityList"
    actions   = ["s3:ListBucket"]
    resources = [aws_s3_bucket.swagger.arn]

    principals {
      type        = "AWS"
      identifiers = [aws_cloudfront_origin_access_identity.swagger.iam_arn]
    }
  }
}
