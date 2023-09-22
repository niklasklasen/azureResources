using 'main.bicep'

param parEnvironmentName = 'p'
param parSolution = 'patchmgmt'
param parLocation = 'swedencentral'
param parRegionShortName = 'sec'
param parTags = {
    environment: 'production'
}

param parMaintenanceConfigurations = {
    maintenanceConfigurationDailyDefinitions: {
        maintenanceConfigurationSuffix: 'dailyDefinitions'
        dynamicScopeSuffix: 'all-europe'
        inGuestPatchMode: 'user'
        linuxClassificationsToInclude: []
        linuxPackageNameMasksToExclude: []
        linuxPackageNameMasksToInclude: []
        windowsClassificationsToInclude:[
            'Definition'
        ]
        windowsExcludeKbsRequiringReboot: false
        windowsKbNumbersToExclude: []
        windowsKbNumbersToInclude: []
        rebootSetting: 'IfRequired'
        maintenanceScope: 'InGuestPatch'
        maintenanceWindowDuration: '02:00'
        maintenanceWindowExpirationDateTime: ''
        maintenanceWindowRecurEvery: '1Day'
        maintenanceWindowStartDateTime: '2020-01-01 03:00' // Build variable in Main so only the Time is needed in Param file.
        maintenanceWindowTimeZone: 'W. Europe Standard Time'
        filterLocations: [
            'westeurope'
            'swedencentral'
        ]
        filterOsTypes: [
            'Windows'
            'Linux'
        ]
        filterResourceGroups: []
        filterResourceTypes: [
            'microsoft.compute/virtualmachines'
            'microsoft.hybridcompute/machines'
        ]
        filterTagOperator: 'Any'
        filterTags: {}
    }
}
