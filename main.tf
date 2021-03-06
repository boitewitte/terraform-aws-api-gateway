data "aws_acm_certificate" "domain" {
  provider = "aws.certificate"

  domain   = "${var.domain_name}"
  statuses = ["ISSUED"]
}

data "aws_route53_zone" "zone" {
  name         = "${var.zone_name}"
}


resource "aws_api_gateway_rest_api" "rest_api" {
    name        = "${var.api_name}"
    description = "${var.api_description}"
}

resource "aws_api_gateway_domain_name" "domain_name" {
    domain_name     = "${var.domain_name}"
    certificate_arn = "${data.aws_acm_certificate.domain.arn}"
}

resource "aws_route53_record" "alias_record" {
    zone_id = "${data.aws_route53_zone.zone.zone_id}"
    name    = "${aws_api_gateway_domain_name.domain_name.domain_name}"
    type = "A"

    alias {
        name                   = "${aws_api_gateway_domain_name.domain_name.cloudfront_domain_name}"
        zone_id                = "${aws_api_gateway_domain_name.domain_name.cloudfront_zone_id}"
        evaluate_target_health = true
    }
}

resource "aws_api_gateway_base_path_mapping" "development" {
    domain_name = "${aws_api_gateway_domain_name.domain_name.domain_name}"
    api_id      = "${aws_api_gateway_rest_api.rest_api.id}"
}
