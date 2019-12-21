locals {
  interpreter = lower(var.os) == "windows" ? ["C:/Program Files/Git/bin/bash.exe", "-c"] : []
}

module "wc3_swagger" {
  source = "./modules/swagger"

  route_53_zone_name  = local.blizzard_quotes_hostname
  hostname            = local.wc3_swagger_hostname
  game                = "wc3"
  profile             = var.profile
  acm_certificate_arn = aws_acm_certificate.wc3_quotes.arn
  s3_swagger_bucket   = "blizzard-quotes-wc3-swagger"
  s3_logs_bucket      = local.s3_bucket_logs_name
}

module "sc2_swagger" {
  source = "./modules/swagger"

  route_53_zone_name  = local.blizzard_quotes_hostname
  hostname            = local.sc2_swagger_hostname
  game                = "sc2"
  profile             = var.profile
  acm_certificate_arn = aws_acm_certificate.sc2_quotes.arn
  s3_swagger_bucket   = "blizzard-quotes-sc2-swagger"
  s3_logs_bucket      = local.s3_bucket_logs_name
}

module "sc_swagger" {
  source = "./modules/swagger"

  route_53_zone_name  = local.blizzard_quotes_hostname
  hostname            = local.sc_swagger_hostname
  game                = "sc"
  profile             = var.profile
  acm_certificate_arn = aws_acm_certificate.sc_quotes.arn
  s3_swagger_bucket   = "blizzard-quotes-sc-swagger"
  s3_logs_bucket      = local.s3_bucket_logs_name
}

module "wc3_swagger_ui" {
  source = "github.com/whitebread-cloud/terraform-aws-s3-swagger-ui"

  s3_bucket_path     = "${module.wc3_swagger.s3_swagger_bucket_id}"
  openapi_spec_paths = ["${path.cwd}/specifications/wc3/v1.yml"]
  openapi_spec_urls  = ["https://${local.wc3_swagger_hostname}/v1.yml"]

  interpreter = local.interpreter
  profile     = var.profile
}

module "sc2_swagger_ui" {
  source = "github.com/whitebread-cloud/terraform-aws-s3-swagger-ui"

  s3_bucket_path     = "${module.sc2_swagger.s3_swagger_bucket_id}"
  openapi_spec_paths = ["${path.cwd}/specifications/sc2/v1.yml"]
  openapi_spec_urls  = ["https://${local.sc2_swagger_hostname}/v1.yml"]

  interpreter = local.interpreter
  profile     = var.profile
}

module "sc_swagger_ui" {
  source = "github.com/whitebread-cloud/terraform-aws-s3-swagger-ui"

  s3_bucket_path     = "${module.sc_swagger.s3_swagger_bucket_id}"
  openapi_spec_paths = ["${path.cwd}/specifications/sc/v1.yml"]
  openapi_spec_urls  = ["https://${local.sc_swagger_hostname}/v1.yml"]

  interpreter = local.interpreter
  profile     = var.profile
}
