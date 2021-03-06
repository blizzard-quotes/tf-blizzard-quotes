locals {
  s3_prefix                         = "blizzard-quotes"
  s3_bucket_logs_name               = "${local.s3_prefix}-logs"
  s3_bucket_blizzard_quotes_ui_name = "${local.s3_prefix}-ui"
  s3_bucket_wc3_quotes_ui_name      = "${local.s3_prefix}-wc3-ui"
  s3_bucket_sc2_quotes_ui_name      = "${local.s3_prefix}-sc2-ui"
  s3_bucket_sc_quotes_ui_name       = "${local.s3_prefix}-sc-ui"
  s3_bucket_wc3_swagger_name        = "${local.s3_prefix}-wc3-swagger"
  s3_bucket_sc2_swagger_name        = "${local.s3_prefix}-sc2-swagger"
  s3_bucket_sc_swagger_name         = "${local.s3_prefix}-sc-swagger"

  hostname_blizzard_quotes = "blizzardquotes.com"
  hostname_wc3             = "wc3.${local.hostname_blizzard_quotes}"
  hostname_wc3_api         = "api.${local.hostname_wc3}"
  hostname_wc3_swagger     = "swagger.${local.hostname_wc3}"
  hostname_sc2             = "sc2.${local.hostname_blizzard_quotes}"
  hostname_sc2_api         = "api.${local.hostname_sc2}"
  hostname_sc2_swagger     = "swagger.${local.hostname_sc2}"
  hostname_sc              = "sc.${local.hostname_blizzard_quotes}"
  hostname_sc_api          = "api.${local.hostname_sc}"
  hostname_sc_swagger      = "swagger.${local.hostname_sc}"
}
