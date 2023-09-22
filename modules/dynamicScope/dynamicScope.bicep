param parDynamicScopeName string
param parLocation string
param parFilterLocations array
param parFilterOsTypes array
param parFilterResourceGroups array
param parFilterResourceTypes array // Allowed 'microsoft.hybridcompute/machines' + AzureVM
param parMaintenanceConfigurationId string

resource resDynamicScope 'Microsoft.Maintenance/configurationAssignments@2023-04-01' = {
  name: parDynamicScopeName
  location: parLocation
  properties: {
    filter: {
      locations: parFilterLocations
      osTypes: parFilterOsTypes
      resourceGroups: parFilterResourceGroups
      resourceTypes: parFilterResourceTypes
    }
    maintenanceConfigurationId: parMaintenanceConfigurationId
  }
}
