variable "route_53_zone_name" {
  description = "Route 53 zone name"
}

variable "hostname" {
  description = "Hostname for the swagger ui"
}

variable "game" {
  description = "Game for the swagger ui. E.g. wc3"
}

variable "profile" {
  description = "The profile for the account (typically default)"
}

variable "acm_certificate_arn" {
  description = "Certificate arn to be used"
}

variable "s3_swagger_bucket" {
  description = "S3 bucket for housing the swagger ui"
}

variable "s3_logs_bucket" {
  description = "S3 bucket housing all of the logs"
}
