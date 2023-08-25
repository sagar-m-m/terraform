output "domain" {
  description = "The domain name for the created record"
  value       = var.domain
}

output "created_records" {
  description = "The created records for the domain"
  value = [for r in godaddy_domain_record.dns.record : {
    name = r.name
    type = r.type
    data = r.data
    ttl  = r.ttl
  }]
}
