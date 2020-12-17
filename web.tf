module "blizzard_quotes_ui" {
  source = "github.com/whitebread-cloud/terraform-aws-s3-cloud-front-route-53"

  hostname            = local.blizzard_quotes_hostname
  alt_hostnames       = ["www.${local.blizzard_quotes_hostname}"]
  route_53_zone_name  = local.blizzard_quotes_hostname
  acm_certificate_arn = aws_acm_certificate.blizzard_quotes.arn
  s3_web_bucket       = local.s3_bucket_blizzard_quotes_ui_name
  s3_logs_bucket      = local.s3_bucket_logs_name
  s3_force_destroy    = true
  s3_versioning       = false
  profile             = var.profile
}

module "wc3_quotes_ui" {
  source = "github.com/whitebread-cloud/terraform-aws-s3-cloud-front-route-53"

  hostname            = local.wc3_hostname
  route_53_zone_name  = local.blizzard_quotes_hostname
  acm_certificate_arn = aws_acm_certificate.wc3_quotes.arn
  s3_web_bucket       = local.s3_bucket_wc3_quotes_ui_name
  s3_logs_bucket      = local.s3_bucket_logs_name
  s3_force_destroy    = true
  s3_versioning       = false
  profile             = var.profile
}

module "sc2_quotes_ui" {
  source = "github.com/whitebread-cloud/terraform-aws-s3-cloud-front-route-53"

  hostname            = local.sc2_hostname
  route_53_zone_name  = local.blizzard_quotes_hostname
  acm_certificate_arn = aws_acm_certificate.sc2_quotes.arn
  s3_web_bucket       = local.s3_bucket_sc2_quotes_ui_name
  s3_logs_bucket      = local.s3_bucket_logs_name
  s3_force_destroy    = true
  s3_versioning       = false
  profile             = var.profile
}

module "sc_quotes_ui" {
  source = "github.com/whitebread-cloud/terraform-aws-s3-cloud-front-route-53"

  hostname            = local.sc_hostname
  route_53_zone_name  = local.blizzard_quotes_hostname
  acm_certificate_arn = aws_acm_certificate.sc_quotes.arn
  s3_web_bucket       = local.s3_bucket_sc_quotes_ui_name
  s3_logs_bucket      = local.s3_bucket_logs_name
  s3_force_destroy    = true
  s3_versioning       = false
  profile             = var.profile
}
