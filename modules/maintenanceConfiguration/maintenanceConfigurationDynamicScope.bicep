param parMaintenanceConfigurationName string
param parLocation string
param parTags object
param parInGuestPatchMode string //Deafult 'user'
param parLinuxClassificationsToInclude array
param parLinuxPackageNameMasksToExclude array // Default null
param parLinuxPackageNameMasksToInclude array // Default null
param parWindowsClassificationsToInclude array
param parWindowsExcludeKbsRequiringReboot bool
param parWindowsKbNumbersToExclude array // Default null
param parWindowsKbNumbersToInclude array //Default null
param parRebootSetting string
param parMaintenanceScope string // Default 'InGuestPatch'
param parMaintenanceWindowDuration string
param parMaintenanceWindowExpirationDateTime string // Default null
param parMaintenanceWindowRecurEvery string
param parMaintenanceWindowStartDateTime string // Build variable in Main so only the Time is needed in Param file.
param parMaintenanceWindowTimeZone string
param parDynamicScopeName string
param parFilterLocations array
param parFilterOsTypes array
param parFilterResourceGroups array
param parFilterResourceTypes array // Allowed 'microsoft.hybridcompute/machines' + AzureVM

resource resMaintenanceConfiguration 'Microsoft.Maintenance/maintenanceConfigurations@2023-04-01' = {
  name: parMaintenanceConfigurationName
  location: parLocation
  tags: parTags
  properties: {
    extensionProperties: {
      InGuestPatchMode: parInGuestPatchMode
    }
    installPatches: {
      linuxParameters: {
        classificationsToInclude: parLinuxClassificationsToInclude
        packageNameMasksToExclude: parLinuxPackageNameMasksToExclude
        packageNameMasksToInclude: parLinuxPackageNameMasksToInclude
      }
      rebootSetting: parRebootSetting
      windowsParameters: {
        classificationsToInclude: parWindowsClassificationsToInclude
        excludeKbsRequiringReboot: parWindowsExcludeKbsRequiringReboot
        kbNumbersToExclude: parWindowsKbNumbersToExclude
        kbNumbersToInclude: parWindowsKbNumbersToInclude
      }
    }
    maintenanceScope: parMaintenanceScope
    maintenanceWindow: {
      duration: parMaintenanceWindowDuration
      expirationDateTime: parMaintenanceWindowExpirationDateTime
      recurEvery: parMaintenanceWindowRecurEvery
      startDateTime: parMaintenanceWindowStartDateTime
      timeZone: parMaintenanceWindowTimeZone
    }
    namespace: null
    visibility: 'custom'
  }
}

module modDynamicScope '../dynamicScope/dynamicScope.bicep' = {
  name: 
  params: {
    parDynamicScopeName: parDynamicScopeName
    parFilterLocations: parFilterLocations
    parFilterOsTypes: parFilterOsTypes
    parFilterResourceGroups: parFilterResourceGroups
    parFilterResourceTypes: parFilterResourceTypes
    parLocation: parLocation
    parMaintenanceConfigurationId: resMaintenanceConfiguration.id
  }
}

