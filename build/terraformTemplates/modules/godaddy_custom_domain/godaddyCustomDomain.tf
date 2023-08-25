resource "godaddy_domain_record" "dns" {
  domain = var.domain

  dynamic "record" {

    for_each = var.records
    content {

      name = each.value.name
      type = each.value.type
      data = each.value.data
      ttl  = each.value.ttl

    }

  }

}
