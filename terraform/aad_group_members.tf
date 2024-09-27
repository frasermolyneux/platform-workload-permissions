locals {
  aad_group_memberships = flatten([
    for principal in var.service_principals : [
      for aad_group in principal.aad_memberships : {
        key            = format("%s-%s", principal.name, aad_group)
        principal_name = principal.name
        aad_group      = aad_group
      }
    ]
  ])
}

resource "azuread_group_member" "group_membership" {
  for_each = { for each in local.aad_group_memberships : each.key => each }

  group_object_id  = data.azuread_group.groups[each.value.aad_group].object_id
  member_object_id = data.azuread_service_principal.workload[each.value.principal_name].object_id
}
