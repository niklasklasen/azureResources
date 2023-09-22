targetScope = 'subscription'

param parLocation string
param parTags object
param parResourceGroupName string

param resourceGroups object

param parMaintenanceConfigurations object

var RGNAME
var MAINTCONFIGNAME

module modResourceGroup '../modules/resourceGroup/resourceGroup.bicep' = {
  name: 'ResourceGroupDeployment'
  params: {
    parResourceGroupLocation: parLocation
    parResourceGroupName: parResourceGroupName
    parResourceGroupTags: parTags
  }
}]

module modMaintenanceConfiguration '../modules/maintenanceConfiguration/maintenanceConfigurationDynamicScope.bicep' = [for maintConfig in items(parMaintenanceConfigurations): {
  scope: modResourceGroup.name
  name: 
  params: {
    parDynamicScopeName: 
    parFilterLocations: 
    parFilterOsTypes: 
    parFilterResourceGroups: 
    parFilterResourceTypes: 
    parInGuestPatchMode: 
    parLinuxClassificationsToInclude: 
    parLinuxPackageNameMasksToExclude: 
    parLinuxPackageNameMasksToInclude: 
    parLocation: parLocation
    parMaintenanceConfigurationName: 
    parMaintenanceScope: 
    parMaintenanceWindowDuration: 
    parMaintenanceWindowExpirationDateTime: 
    parMaintenanceWindowRecurEvery: 
    parMaintenanceWindowStartDateTime: 
    parMaintenanceWindowTimeZone: 
    parRebootSetting: 
    parTags: parTags
    parWindowsClassificationsToInclude: 
    parWindowsExcludeKbsRequiringReboot: 
    parWindowsKbNumbersToExclude: 
    parWindowsKbNumbersToInclude: 
  }
}

module modResourceGroup '../modules/resourceGroup/resourceGroup.bicep' = [for rg in items(resourceGroups): {
  name: rg.value.rgName
  params: {
    parResourceGroupLocation: parLocation
    parResourceGroupName: rg.value.rgName
    parResourceGroupTags: {}
  }
}]
