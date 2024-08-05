environment = "prd"
location    = "uksouth"
instance    = "01"

tags = {
  Environment = "prd",
  Workload    = "platform",
  DeployedBy  = "GitHub-Terraform",
  Git         = "https://github.com/frasermolyneux/platform-strategic-services-permissions"
}

aad_groups = []

subscriptions = {
  sub-platform-connectivity = {
    name            = "sub-platform-connectivity"
    subscription_id = "db34f572-8b71-40d6-8f99-f29a27612144"
  },
  sub-platform-strategic = {
    name            = "sub-platform-strategic"
    subscription_id = "903b6685-c12a-4703-ac54-7ec1ff15ca43"
  },
  sub-visualstudio-enterprise = {
    name            = "sub-visualstudio-enterprise"
    subscription_id = "d68448b0-9947-46d7-8771-baa331a3063a"
  }
}

service_principals = [
  {
    name = "spn-platform-landing-zones-production"
  },
  {
    name = "spn-demo-manager-production"
    role_assignments = [
      { // Required to pull Bicep modules from the ACR
        role_definition_name = "AcrPull",
        scope                = "/subscriptions/903b6685-c12a-4703-ac54-7ec1ff15ca43/resourceGroups/rg-platform-acr-prd-uksouth-01/providers/Microsoft.ContainerRegistry/registries/acrty7og2i6qpv3s"
      }
    ]
  },
  {
    name = "spn-geo-location-development"
    role_assignments = [
      { // Required to pull Bicep modules from the ACR
        role_definition_name = "AcrPull",
        scope                = "/subscriptions/903b6685-c12a-4703-ac54-7ec1ff15ca43/resourceGroups/rg-platform-acr-prd-uksouth-01/providers/Microsoft.ContainerRegistry/registries/acrty7og2i6qpv3s"
      },
      { // Required to create DNS configuration for external facing services
        role_definition_name = "DNS Zone Contributor",
        scope                = "/subscriptions/db34f572-8b71-40d6-8f99-f29a27612144/resourceGroups/rg-platform-dns-prd-uksouth-01"
        provider             = "sub-platform-connectivity"
      }
    ]
  },
  {
    name = "spn-geo-location-production"
    role_assignments = [
      { // Required to pull Bicep modules from the ACR
        role_definition_name = "AcrPull",
        scope                = "/subscriptions/903b6685-c12a-4703-ac54-7ec1ff15ca43/resourceGroups/rg-platform-acr-prd-uksouth-01/providers/Microsoft.ContainerRegistry/registries/acrty7og2i6qpv3s"
      },
      { // Required to create DNS configuration for external facing services
        role_definition_name = "DNS Zone Contributor",
        scope                = "/subscriptions/db34f572-8b71-40d6-8f99-f29a27612144/resourceGroups/rg-platform-dns-prd-uksouth-01"
        provider             = "sub-platform-connectivity"
      }
    ]
  },
  {
    name = "spn-platform-connectivity-development"
    role_assignments = [
      { // Required to pull Bicep modules from the ACR
        role_definition_name = "AcrPull",
        scope                = "/subscriptions/903b6685-c12a-4703-ac54-7ec1ff15ca43/resourceGroups/rg-platform-acr-prd-uksouth-01/providers/Microsoft.ContainerRegistry/registries/acrty7og2i6qpv3s"
      }
    ]
  },
  {
    name = "spn-platform-connectivity-production"
    role_assignments = [
      { // Required to pull Bicep modules from the ACR
        role_definition_name = "AcrPull",
        scope                = "/subscriptions/903b6685-c12a-4703-ac54-7ec1ff15ca43/resourceGroups/rg-platform-acr-prd-uksouth-01/providers/Microsoft.ContainerRegistry/registries/acrty7og2i6qpv3s"
      }
    ]
  },
  {
    name = "spn-platform-monitoring-production"
    role_assignments = [
      { // Required to pull Bicep modules from the ACR
        role_definition_name = "AcrPull",
        scope                = "/subscriptions/903b6685-c12a-4703-ac54-7ec1ff15ca43/resourceGroups/rg-platform-acr-prd-uksouth-01/providers/Microsoft.ContainerRegistry/registries/acrty7og2i6qpv3s"
      }
    ]
  },
  {
    name = "spn-platform-strategic-services-development"
  },
  {
    name = "spn-platform-workload-permissions-production"
  },
  {
    name = "spn-platform-strategic-services-production"
  },
  {
    name = "spn-portal-event-ingest-development"
    role_assignments = [
      { // Required to create DNS configuration for external facing services
        role_definition_name = "DNS Zone Contributor",
        scope                = "/subscriptions/db34f572-8b71-40d6-8f99-f29a27612144/resourceGroups/rg-platform-dns-prd-uksouth-01"
        provider             = "sub-platform-connectivity"
      }
    ]
  },
  {
    name = "spn-portal-event-ingest-production"
    role_assignments = [
      { // Required to create DNS configuration for external facing services
        role_definition_name = "DNS Zone Contributor",
        scope                = "/subscriptions/db34f572-8b71-40d6-8f99-f29a27612144/resourceGroups/rg-platform-dns-prd-uksouth-01"
        provider             = "sub-platform-connectivity"
      }
    ]
  },
  {
    name = "spn-portal-repository-development"
    role_assignments = [
      { // Required to create DNS configuration for external facing services
        role_definition_name = "DNS Zone Contributor",
        scope                = "/subscriptions/db34f572-8b71-40d6-8f99-f29a27612144/resourceGroups/rg-platform-dns-prd-uksouth-01"
        provider             = "sub-platform-connectivity"
      }
    ]
  },
  {
    name = "spn-portal-repository-production"
    role_assignments = [
      { // Required to create DNS configuration for external facing services
        role_definition_name = "DNS Zone Contributor",
        scope                = "/subscriptions/db34f572-8b71-40d6-8f99-f29a27612144/resourceGroups/rg-platform-dns-prd-uksouth-01"
        provider             = "sub-platform-connectivity"
      }
    ]
  },
  {
    name             = "spn-portal-repository-func-development"
    role_assignments = []
  },
  {
    name             = "spn-portal-repository-func-production"
    role_assignments = []
  },
  {
    name = "spn-portal-servers-integration-development"
    role_assignments = [
      { // Required to pull Bicep modules from the ACR
        role_definition_name = "AcrPull",
        scope                = "/subscriptions/903b6685-c12a-4703-ac54-7ec1ff15ca43/resourceGroups/rg-platform-acr-prd-uksouth-01/providers/Microsoft.ContainerRegistry/registries/acrty7og2i6qpv3s"
      },
      { // Required to create DNS configuration for external facing services
        role_definition_name = "DNS Zone Contributor",
        scope                = "/subscriptions/db34f572-8b71-40d6-8f99-f29a27612144/resourceGroups/rg-platform-dns-prd-uksouth-01"
        provider             = "sub-platform-connectivity"
      }
    ]
  },
  {
    name = "spn-portal-servers-integration-production"
    role_assignments = [
      { // Required to pull Bicep modules from the ACR
        role_definition_name = "AcrPull",
        scope                = "/subscriptions/903b6685-c12a-4703-ac54-7ec1ff15ca43/resourceGroups/rg-platform-acr-prd-uksouth-01/providers/Microsoft.ContainerRegistry/registries/acrty7og2i6qpv3s"
      },
      { // Required to create DNS configuration for external facing services
        role_definition_name = "DNS Zone Contributor",
        scope                = "/subscriptions/db34f572-8b71-40d6-8f99-f29a27612144/resourceGroups/rg-platform-dns-prd-uksouth-01"
        provider             = "sub-platform-connectivity"
      }
    ]
  },
  {
    name             = "spn-portal-sync-development"
    role_assignments = []
  },
  {
    name             = "spn-portal-sync-production"
    role_assignments = []
  },
  {
    name = "spn-xtremeidiots-portal-development"
    role_assignments = [
      { // Required to pull Bicep modules from the ACR
        role_definition_name = "AcrPull",
        scope                = "/subscriptions/903b6685-c12a-4703-ac54-7ec1ff15ca43/resourceGroups/rg-platform-acr-prd-uksouth-01/providers/Microsoft.ContainerRegistry/registries/acrty7og2i6qpv3s"
      },
      { // Required to create DNS configuration for external facing services
        role_definition_name = "DNS Zone Contributor",
        scope                = "/subscriptions/db34f572-8b71-40d6-8f99-f29a27612144/resourceGroups/rg-platform-dns-prd-uksouth-01"
        provider             = "sub-platform-connectivity"
      }
    ]
  },
  {
    name = "spn-xtremeidiots-portal-production"
    role_assignments = [
      { // Required to pull Bicep modules from the ACR
        role_definition_name = "AcrPull",
        scope                = "/subscriptions/903b6685-c12a-4703-ac54-7ec1ff15ca43/resourceGroups/rg-platform-acr-prd-uksouth-01/providers/Microsoft.ContainerRegistry/registries/acrty7og2i6qpv3s"
      },
      { // Required to create DNS configuration for external facing services
        role_definition_name = "DNS Zone Contributor",
        scope                = "/subscriptions/db34f572-8b71-40d6-8f99-f29a27612144/resourceGroups/rg-platform-dns-prd-uksouth-01"
        provider             = "sub-platform-connectivity"
      }
    ]
  },
  {
    name = "spn-bicep-modules-production"
    role_assignments = [
      { // Required to push Bicep modules to the ACR
        role_definition_name = "Contributor",
        scope                = "/subscriptions/903b6685-c12a-4703-ac54-7ec1ff15ca43/resourceGroups/rg-platform-acr-prd-uksouth-01/providers/Microsoft.ContainerRegistry/registries/acrty7og2i6qpv3s"
      }
    ]
  },
  {
    name             = "spn-personal-finances-development"
    role_assignments = []
  },
  {
    name             = "spn-personal-finances-production"
    role_assignments = []
  },
  {
    name = "spn-molyneux-me-development"
    role_assignments = [
      { // Required to create DNS configuration for external facing services
        role_definition_name = "DNS Zone Contributor",
        scope                = "/subscriptions/db34f572-8b71-40d6-8f99-f29a27612144/resourceGroups/rg-platform-dns-prd-uksouth-01/providers/Microsoft.Network/dnszones/molyneux.me"
        provider             = "sub-platform-connectivity"
    }]
  },
  {
    name = "spn-molyneux-me-production"
    role_assignments = [
      { // Required to create DNS configuration for external facing services
        role_definition_name = "DNS Zone Contributor",
        scope                = "/subscriptions/db34f572-8b71-40d6-8f99-f29a27612144/resourceGroups/rg-platform-dns-prd-uksouth-01/providers/Microsoft.Network/dnszones/molyneux.me"
        provider             = "sub-platform-connectivity"
    }]
  }
]
