data "aws_route53_zone" "blizzard_quotes" {
  name         = local.hostname_blizzard_quotes
  private_zone = false
}
