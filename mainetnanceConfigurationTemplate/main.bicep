targetScope = 'subscription'

param parEnvironmentName string
param parSolution string
param parLocation string
param parRegionShortName  string
param parTags object
param parMaintenanceConfigurations object

var varResourceGroupName = '${parEnvironmentName}-${parSolution}-${parRegionShortName}-rg'
var varMaintenanceConfigurationNamePrefix = '${parEnvironmentName}-${parSolution}-${parRegionShortName}-mc'

module modMaintenanceConfigurationResourceGroup '../_modules/resourceGroup/resourceGroup.bicep' = {
  name: '${varResourceGroupName}-Deployment'
  params: {
    parLocation: parLocation
    parResourceGroupName: varResourceGroupName
    parTags: parTags
  }
}

module modMaintenanceConfiguration '../_modules/maintenanceConfiguration/maintenanceConfiguration.bicep' = [for maintConfig in items(parMaintenanceConfigurations): {
  scope: resourceGroup(varResourceGroupName)
  name: '${varMaintenanceConfigurationNamePrefix}-${maintConfig.value.maintenanceConfigurationSuffix}-Deployment'
  dependsOn: [
    modMaintenanceConfigurationResourceGroup
  ]
  params: {
    parLinuxClassificationsToInclude: maintConfig.value.linuxClassificationsToInclude
    parLocation: parLocation
    parMaintenanceConfigurationName: '${varMaintenanceConfigurationNamePrefix}-${maintConfig.value.maintenanceConfigurationSuffix}'
    parMaintenanceWindowDuration: maintConfig.value.maintenanceWindowDuration
    parMaintenanceWindowRecurEvery: maintConfig.value.maintenanceWindowRecurEvery
    parMaintenanceWindowStartDateTime: maintConfig.value.maintenanceWindowStartDateTime
    parMaintenanceWindowTimeZone: maintConfig.value.maintenanceWindowTimeZone
    parRebootSetting: maintConfig.value.rebootSetting
    parTags: parTags
    parWindowsClassificationsToInclude: maintConfig.value.windowsClassificationsToInclude
    parWindowsExcludeKbsRequiringReboot: maintConfig.value.windowsExcludeKbsRequiringReboot
  }
}]
