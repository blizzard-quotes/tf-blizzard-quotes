locals {
  interpreter = lower(var.os) == "windows" ? ["C:/Program Files/Git/bin/bash.exe", "-c"] : ["/usr/bin/env", "bash", "-c"]
}

module "wc3_swagger" {
  source = "github.com/whitebread-cloud/terraform-aws-s3-cloud-front-route-53"

  hostname            = local.hostname_wc3_swagger
  route_53_zone_name  = local.hostname_blizzard_quotes
  acm_certificate_arn = aws_acm_certificate.wc3_quotes.arn
  s3_web_bucket       = local.s3_bucket_wc3_swagger_name
  s3_logs_bucket      = local.s3_bucket_logs_name
  s3_force_destroy    = true
  s3_versioning       = false
  profile             = var.profile
}

module "sc2_swagger" {
  source = "github.com/whitebread-cloud/terraform-aws-s3-cloud-front-route-53"

  hostname            = local.hostname_sc2_swagger
  route_53_zone_name  = local.hostname_blizzard_quotes
  acm_certificate_arn = aws_acm_certificate.sc2_quotes.arn
  s3_web_bucket       = local.s3_bucket_sc2_swagger_name
  s3_logs_bucket      = local.s3_bucket_logs_name
  s3_force_destroy    = true
  s3_versioning       = false
  profile             = var.profile
}

module "sc_swagger" {
  source = "github.com/whitebread-cloud/terraform-aws-s3-cloud-front-route-53"

  hostname            = local.hostname_sc_swagger
  route_53_zone_name  = local.hostname_blizzard_quotes
  acm_certificate_arn = aws_acm_certificate.sc_quotes.arn
  s3_web_bucket       = local.s3_bucket_sc_swagger_name
  s3_logs_bucket      = local.s3_bucket_logs_name
  s3_force_destroy    = true
  s3_versioning       = false
  profile             = var.profile
}

module "wc3_swagger_ui" {
  source = "github.com/whitebread-cloud/terraform-aws-s3-swagger-ui"

  s3_bucket_path     = module.wc3_swagger.s3_web_bucket_id
  openapi_spec_paths = ["${path.cwd}/specifications/wc3/v1.yml"]
  openapi_spec_urls  = ["https://${local.hostname_wc3_swagger}/v1.yml"]

  interpreter = local.interpreter
  profile     = var.profile
}

module "sc2_swagger_ui" {
  source = "github.com/whitebread-cloud/terraform-aws-s3-swagger-ui"

  s3_bucket_path     = module.sc2_swagger.s3_web_bucket_id
  openapi_spec_paths = ["${path.cwd}/specifications/sc2/v1.yml"]
  openapi_spec_urls  = ["https://${local.hostname_sc2_swagger}/v1.yml"]

  interpreter = local.interpreter
  profile     = var.profile
}

module "sc_swagger_ui" {
  source = "github.com/whitebread-cloud/terraform-aws-s3-swagger-ui"

  s3_bucket_path     = module.sc_swagger.s3_web_bucket_id
  openapi_spec_paths = ["${path.cwd}/specifications/sc/v1.yml"]
  openapi_spec_urls  = ["https://${local.hostname_sc_swagger}/v1.yml"]

  interpreter = local.interpreter
  profile     = var.profile
}
