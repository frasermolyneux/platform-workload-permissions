data "azuread_group" "groups" {
  for_each = toset(var.aad_groups)

  display_name     = each.value
  security_enabled = true
}
