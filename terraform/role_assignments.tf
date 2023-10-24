locals {
  principal_role_assignments = flatten([
    for principal in var.service_principals : [
      for role_assignment in principal.role_assignments : {
        key                  = format("%s-%s-%s", principal.name, role_assignment.scope, role_assignment.role_definition_name)
        scope                = role_assignment.scope
        principal_name       = principal.name
        role_definition_name = role_assignment.role_definition_name
        provider             = role_assignment.provider
      }
    ]
  ])
}

resource "azurerm_role_assignment" "sub_platform_strategic" {
  for_each = { for each in local.principal_role_assignments : each.key => each if each.provider == null }

  scope                = each.value.scope
  role_definition_name = each.value.role_definition_name
  principal_id         = data.azuread_service_principal.workload[each.value.principal_name].object_id
}

resource "azurerm_role_assignment" "sub_platform_connectivity" {
  for_each = { for each in local.principal_role_assignments : each.key => each if each.provider == "sub-platform-connectivity" }

  provider = azurerm.sub-platform-connectivity

  scope                = each.value.scope
  role_definition_name = each.value.role_definition_name
  principal_id         = data.azuread_service_principal.workload[each.value.principal_name].object_id
}

resource "azurerm_role_assignment" "sub_visualstudio_enterprise" {
  for_each = { for each in local.principal_role_assignments : each.key => each if each.provider == "sub-visualstudio-enterprise" }

  provider = azurerm.sub-visualstudio-enterprise

  scope                = each.value.scope
  role_definition_name = each.value.role_definition_name
  principal_id         = data.azuread_service_principal.workload[each.value.principal_name].object_id
}
