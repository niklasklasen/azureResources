using 'main.bicep'

param parLocation = 'swedencentral'
param parTags = {
    environment: 'production'
}

param parMaintenanceConfigurations = {
    maintenanceConfigurationDailyDefinitions: {
        inGuestPatchMode: 'user'
        linuxClassificationsToInclude
        linuxPackageNameMasksToExclude: null
        linuxPackageNameMasksToInclude: null
        windowsClassificationsToInclude: 
        windowsExcludeKbsRequiringReboot: 
        windowsKbNumbersToExclude: null
        windowsKbNumbersToInclude: null
        rebootSetting:
        maintenanceScope: 'InGuestPatch'
    }
}

parDynamicScopeName: 
    parFilterLocations: 
    parFilterOsTypes: 
    parFilterResourceGroups: 
    parFilterResourceTypes: 
    parMaintenanceWindowDuration: 
    parMaintenanceWindowExpirationDateTime: 
    parMaintenanceWindowRecurEvery: 
    parMaintenanceWindowStartDateTime: 
    parMaintenanceWindowTimeZone: 
    parWindowsClassificationsToInclude: 
    parWindowsExcludeKbsRequiringReboot: 
    parWindowsKbNumbersToExclude: 
    parWindowsKbNumbersToInclude: 

param resourceGroups = {
    resourceGroup1: {
        rgName : 'demoRG-1'
  }
    resourceGroup2: {
        rgName : 'demoRG-2'
  }
}
