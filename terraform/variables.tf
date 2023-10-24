variable "environment" {
  default = "dev"
}

variable "location" {
  default = "uksouth"
}

variable "instance" {
  default = "01"
}

variable "tags" {
  default = {}
}

variable "aad_groups" {
  type = list(string)
}

variable "subscriptions" {
  type = map(object({
    name            = string
    subscription_id = string
  }))
}

variable "service_principals" {
  type = list(object({
    name = string

    role_assignments = optional(list(object({
      scope                = string
      role_definition_name = string
      provider             = optional(string, null)
    })), [])

    aad_memberships = optional(list(string), [])
  }))
}
