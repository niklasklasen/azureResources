param parlocation string
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


var varMaintenanceConfigurationName = 

resource resMaintenanceConfiguration 'Microsoft.Maintenance/maintenanceConfigurations@2023-04-01' = {
  name: varMaintenanceConfigurationName
  location: parlocation
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
      duration: '02:00'
      expirationDateTime: null
      recurEvery: '1Month Second Tuesday Offset1'
      startDateTime: '2020-09-18 10:00'
      timeZone: 'W. Europe Standard Time'
    }
    namespace: null
    visibility: 'custom'
  }
}
