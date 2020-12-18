data "aws_route53_zone" "blizzard_quotes" {
  name         = local.blizzard_quotes_hostname
  private_zone = false
}
