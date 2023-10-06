// Parameters
param parMaintenanceConfigurationName string
param parLocation string
param parTags object
param parInGuestPatchMode string = 'user'
param parLinuxClassificationsToInclude array
param parLinuxPackageNameMasksToExclude array = []
param parLinuxPackageNameMasksToInclude array = []
param parWindowsClassificationsToInclude array
param parWindowsExcludeKbsRequiringReboot bool
param parWindowsKbNumbersToExclude array = []
param parWindowsKbNumbersToInclude array = []
param parRebootSetting string
param parMaintenanceScope string = 'InGuestPatch'
param parMaintenanceWindowDuration string
param parMaintenanceWindowExpirationDateTime string = ''
param parMaintenanceWindowRecurEvery string
param parMaintenanceWindowStartDateTime string
param parMaintenanceWindowTimeZone string

// Resources
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

// Output
output outMaintenanceConfigurationNamr string = resMaintenanceConfiguration.name
output outMaintenanceConfigurationId string = resMaintenanceConfiguration.id
