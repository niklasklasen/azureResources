using 'main.bicep'

param parLocation = 'swedencentral'
param parTags = {
    environment: 'production'
}

param parMaintenanceConfigurations = {
    maintenanceConfigurationDailyDefinitions: {
        inGuestPatchMode: 'user'
        linuxClassificationsToInclude: null
        linuxPackageNameMasksToExclude: null
        linuxPackageNameMasksToInclude: null
        windowsClassificationsToInclude:[
            'Definition'
        ]
        windowsExcludeKbsRequiringReboot: false
        windowsKbNumbersToExclude: null
        windowsKbNumbersToInclude: null
        rebootSetting: 'IfRequired'
        maintenanceScope: 'InGuestPatch'
        maintenanceWindowDuration: '02:00'
        maintenanceWindowExpirationDateTime: null
        maintenanceWindowRecurEvery: '1Day'
        maintenanceWindowStartDateTime: '2020-01-01 03:00' // Build variable in Main so only the Time is needed in Param file.
        maintenanceWindowTimeZone: 'W. Europe Standard Time'
        parFilterLocations: [
            'westeurope'
            'swedencentral'
        ]
        parFilterOsTypes: [
            'Windows'
            'Linux'
        ]
        parFilterResourceGroups: []
        parFilterResourceTypes: [
            'microsoft.compute/virtualmachines'
            'microsoft.hybridcompute/machines'
        ]
        filterTagOperator: null
        filterTags: null
    }
}
