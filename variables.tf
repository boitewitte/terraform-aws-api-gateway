variable "aws_access_key" {
    type = "string"
    description = "describe your variable"
}

variable "aws_secret_key" {
    type = "string"
    description = "describe your variable"
}

variable "zone_name" {
    type = "string"
    description = "The ID of the hosted zone to contain this record."
}

variable "api_name" {
    type = "string"
    description = "Name of the API"
}

variable "api_description" {
    type = "string"
    description = "Short description about the API"
}

variable "domain_name" {
    type = "string"
    description = "Custom domain name to assign to the gateway, e.g. api-gateway.example.com"
}
