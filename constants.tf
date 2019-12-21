locals {
  s3_bucket_logs_name      = "blizzard-quotes-logs"
  blizzard_quotes_hostname = "blizzardquotes.com"
  wc3_hostname             = "wc3.${local.blizzard_quotes_hostname}"
  wc3_api_hostname         = "api.${local.wc3_hostname}"
  wc3_swagger_hostname     = "swagger.${local.wc3_hostname}"
  sc2_hostname             = "sc2.${local.blizzard_quotes_hostname}"
  sc2_api_hostname         = "api.${local.sc2_hostname}"
  sc2_swagger_hostname     = "swagger.${local.sc2_hostname}"
  sc_hostname              = "sc.${local.blizzard_quotes_hostname}"
  sc_api_hostname          = "api.${local.sc_hostname}"
  sc_swagger_hostname      = "swagger.${local.sc_hostname}"
}
