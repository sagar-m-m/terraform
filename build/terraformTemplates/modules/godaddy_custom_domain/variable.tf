variable "domain" {
  description = "The name of the domain"
  type        = string
}

variable "records" {
  description = "List of record to add to godaddy"
  type = list(object({
    name = string
    type = string
    data = string
    ttl  = number
  }))
  default = []
}
