data "azuread_service_principal" "workload" {
  for_each = { for each in var.service_principals : each.name => each }

  display_name = each.key
}
