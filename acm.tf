resource "aws_acm_certificate" "blizzard_quotes" {
  domain_name       = local.hostname_blizzard_quotes
  validation_method = "DNS"

  subject_alternative_names = ["www.${local.hostname_blizzard_quotes}"]

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
  domain_name       = local.hostname_wc3
  validation_method = "DNS"

  subject_alternative_names = [
    "*.${local.hostname_wc3}",
    "*.${local.hostname_wc3_api}",
    "*.${local.hostname_wc3_swagger}"
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
  domain_name       = local.hostname_sc2
  validation_method = "DNS"

  subject_alternative_names = [
    "*.${local.hostname_sc2}",
    "*.${local.hostname_sc2_api}",
    "*.${local.hostname_sc2_swagger}"
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
  domain_name       = local.hostname_sc
  validation_method = "DNS"

  subject_alternative_names = [
    "*.${local.hostname_sc}",
    "*.${local.hostname_sc_api}",
    "*.${local.hostname_sc_swagger}"
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
