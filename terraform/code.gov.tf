resource "aws_route53_zone" "code_toplevel" {
  name = "code.gov"

  tags {
    Project = "dns"
  }
}

resource "aws_route53_record" "code_gov_apex" {
  zone_id = "${aws_route53_zone.code_toplevel.zone_id}"
  name = "code.gov."
  type = "A"

  alias {
    name = "dqziuvpgrykcy.cloudfront.net."
    zone_id = "Z2FDTNDATAQYW2"
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "code_gov_www" {
  zone_id = "${aws_route53_zone.code_toplevel.zone_id}"
  name = "www.code.gov."
  type = "A"

  alias {
    name = "dqziuvpgrykcy.cloudfront.net."
    zone_id = "Z2FDTNDATAQYW2"
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "staging_code_gov_a" {
  zone_id = "${aws_route53_zone.code_toplevel.zone_id}"
  name = "staging.code.gov."
  type = "A"

  alias {
    name = "d3g0jy911fqt1l.cloudfront.net."
    zone_id = "Z2FDTNDATAQYW2"
    evaluate_target_health = false
  }
}

output "code_ns" {
  value="${aws_route53_zone.code_toplevel.name_servers}"
}
