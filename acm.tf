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

    ignore_changes = [
      # alternative_names makes terraform angsty
      subject_alternative_names
    ]
  }
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

    ignore_changes = [
      # alternative_names makes terraform angsty
      subject_alternative_names
    ]
  }
}
