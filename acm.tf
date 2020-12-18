resource "aws_acm_certificate" "blizzard_quotes" {
  domain_name       = local.blizzard_quotes_hostname
  validation_method = "DNS"

  subject_alternative_names = ["www.${local.blizzard_quotes_hostname}"]

  lifecycle {
    create_before_destroy = true
  }
}

module "blizzard_quotes_acm_dns_validation" {
  source = "./modules/acm/certificate-validation"

  acm_certificate_validation_options = aws_acm_certificate.blizzard_quotes.domain_validation_options
  acm_certificate_arn = aws_acm_certificate.blizzard_quotes.arn
  route_53_zone_id = data.aws_route53_zone.blizzard_quotes.zone_id
}

resource "aws_acm_certificate" "wc3_quotes" {
  domain_name       = local.wc3_hostname
  validation_method = "DNS"

  subject_alternative_names = [
    "*.${local.wc3_hostname}",
    "*.${local.wc3_api_hostname}",
    "*.${local.wc3_swagger_hostname}"
  ]

  lifecycle {
    create_before_destroy = true
  }
}

module "wc3_acm_dns_validation" {
  source = "./modules/acm/certificate-validation"

  acm_certificate_validation_options = aws_acm_certificate.wc3_quotes.domain_validation_options
  acm_certificate_arn = aws_acm_certificate.wc3_quotes.arn
  route_53_zone_id = data.aws_route53_zone.blizzard_quotes.zone_id
}

resource "aws_acm_certificate" "sc2_quotes" {
  domain_name       = local.sc2_hostname
  validation_method = "DNS"

  subject_alternative_names = [
    "*.${local.sc2_hostname}",
    "*.${local.sc2_api_hostname}",
    "*.${local.sc2_swagger_hostname}"
  ]

  lifecycle {
    create_before_destroy = true
  }
}

module "sc2_acm_dns_validation" {
  source = "./modules/acm/certificate-validation"

  acm_certificate_validation_options = aws_acm_certificate.sc2_quotes.domain_validation_options
  acm_certificate_arn = aws_acm_certificate.sc2_quotes.arn
  route_53_zone_id = data.aws_route53_zone.blizzard_quotes.zone_id
}

resource "aws_acm_certificate" "sc_quotes" {
  domain_name       = local.sc_hostname
  validation_method = "DNS"

  subject_alternative_names = [
    "*.${local.sc_hostname}",
    "*.${local.sc_api_hostname}",
    "*.${local.sc_swagger_hostname}"
  ]

  lifecycle {
    create_before_destroy = true
  }
}

module "sc_acm_dns_validation" {
  source = "./modules/acm/certificate-validation"

  acm_certificate_validation_options = aws_acm_certificate.sc_quotes.domain_validation_options
  acm_certificate_arn = aws_acm_certificate.sc_quotes.arn
  route_53_zone_id = data.aws_route53_zone.blizzard_quotes.zone_id
}
