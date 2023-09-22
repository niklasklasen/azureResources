targetScope = 'subscription'

param parEnvironmentName string
param parSolution string
param parLocation string
param parRegionShortName  string
param parTags object
param parMaintenanceConfigurations object

var varResourceGroupName = '${parEnvironmentName}-${parSolution}-${parRegionShortName}-rg'
var varMaintenanceConfigurationNamePrefix = '${parEnvironmentName}-${parSolution}-${parRegionShortName}'

module modResourceGroup '../modules/resourceGroup/resourceGroup.bicep' = {
  name: 'ResourceGroupDeployment'
  params: {
    parResourceGroupLocation: parLocation
    parResourceGroupName: varResourceGroupName
    parResourceGroupTags: parTags
  }
}

module modMaintenanceConfiguration '../modules/maintenanceConfiguration/maintenanceConfigurationDynamicScope.bicep' = [for maintConfig in items(parMaintenanceConfigurations): {
  scope: resourceGroup(modResourceGroup.name)
  name: '${varMaintenanceConfigurationNamePrefix}-${maintConfig.value.maintenanceConfigurationSuffix}-Deployment'
  params: {
    parDynamicScopeName: maintConfig.value.dynamicScopeSuffix
    parFilterLocations: maintConfig.value.filterLocations
    parFilterOsTypes: maintConfig.value.filterOsTypes
    parFilterResourceGroups: maintConfig.value.filterResourceGroups
    parFilterResourceTypes: maintConfig.value.filterResourceTypes
    parInGuestPatchMode: maintConfig.value.inGuestPatchMode
    parLinuxClassificationsToInclude: maintConfig.value.linuxClassificationsToInclude
    parLinuxPackageNameMasksToExclude: maintConfig.value.linuxPackageNameMasksToExclude
    parLinuxPackageNameMasksToInclude: maintConfig.value.linuxPackageNameMasksToInclude
    parLocation: parLocation
    parMaintenanceConfigurationName: '${varMaintenanceConfigurationNamePrefix}-${maintConfig.value.maintenanceConfigurationSuffix}'
    parMaintenanceScope: maintConfig.value.maintenanceScope
    parMaintenanceWindowDuration: maintConfig.value.maintenanceWindowDuration
    parMaintenanceWindowExpirationDateTime: maintConfig.value.maintenanceWindowExpirationDateTime
    parMaintenanceWindowRecurEvery: maintConfig.value.maintenanceWindowRecurEvery
    parMaintenanceWindowStartDateTime: maintConfig.value.maintenanceWindowStartDateTime
    parMaintenanceWindowTimeZone: maintConfig.value.maintenanceWindowTimeZone
    parRebootSetting: maintConfig.value.rebootSetting
    parTags: parTags
    parWindowsClassificationsToInclude: maintConfig.value.windowsClassificationsToInclude
    parWindowsExcludeKbsRequiringReboot: maintConfig.value.windowsExcludeKbsRequiringReboot
    parWindowsKbNumbersToExclude: maintConfig.value.windowsKbNumbersToExclude
    parWindowsKbNumbersToInclude: maintConfig.value.windowsKbNumbersToInclude
    parFilterTagOperator: maintConfig.value.filterTagOperator
    parFilterTags: maintConfig.value.filterTags
  }
}]
