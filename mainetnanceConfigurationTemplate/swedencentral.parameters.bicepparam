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
        rebootSetting: 'Never'
        maintenanceScope: 'InGuestPatch'
        maintenanceWindowDuration: '02:00'
        maintenanceWindowExpirationDateTime: ''
        maintenanceWindowRecurEvery: '1Day'
        maintenanceWindowStartDateTime: '2020-01-01 03:00' // Build variable in Main so only the Time is needed in Param file.
        maintenanceWindowTimeZone: 'W. Europe Standard Time'
    }
    maintenanceConfigurationMonthlySecurityCritical: {
        maintenanceConfigurationSuffix: 'monthlySecurityCritical'
        inGuestPatchMode: 'user'
        linuxClassificationsToInclude: [
            'Security'
            'Critical'
        ]
        linuxPackageNameMasksToExclude: []
        linuxPackageNameMasksToInclude: []
        windowsClassificationsToInclude:[
            'Security'
            'Critical'
        ]
        windowsExcludeKbsRequiringReboot: false
        windowsKbNumbersToExclude: []
        windowsKbNumbersToInclude: []
        rebootSetting: 'IfRequired'
        maintenanceScope: 'InGuestPatch'
        maintenanceWindowDuration: '02:00'
        maintenanceWindowExpirationDateTime: ''
        maintenanceWindowRecurEvery: '1Month Second Tuesday Offset1'
        maintenanceWindowStartDateTime: '2020-01-01 03:00' // Build variable in Main so only the Time is needed in Param file.
        maintenanceWindowTimeZone: 'W. Europe Standard Time'
    }
    maintenanceConfigurationMonthlyPilot: {
        maintenanceConfigurationSuffix: 'monthlyPilot'
        inGuestPatchMode: 'user'
        linuxClassificationsToInclude: [
            'Security'
            'Critical'
            'Other'
        ]
        linuxPackageNameMasksToExclude: []
        linuxPackageNameMasksToInclude: []
        windowsClassificationsToInclude:[
            'Security'
            'Critical'
            'UpdateRollup'
            'FeaturePack'
            'ServicePack'
            'Definition'
            'Tools'
            'Updates'
        ]
        windowsExcludeKbsRequiringReboot: false
        windowsKbNumbersToExclude: []
        windowsKbNumbersToInclude: []
        rebootSetting: 'IfRequired'
        maintenanceScope: 'InGuestPatch'
        maintenanceWindowDuration: '02:00'
        maintenanceWindowExpirationDateTime: ''
        maintenanceWindowRecurEvery: '1Month Second Friday'
        maintenanceWindowStartDateTime: '2020-01-01 03:00' // Build variable in Main so only the Time is needed in Param file.
        maintenanceWindowTimeZone: 'W. Europe Standard Time'
    }
    maintenanceConfigurationMonthlyWaveOne: {
        maintenanceConfigurationSuffix: 'monthlyWaveOne'
        inGuestPatchMode: 'user'
        linuxClassificationsToInclude: [
            'Security'
            'Critical'
            'Other'
        ]
        linuxPackageNameMasksToExclude: []
        linuxPackageNameMasksToInclude: []
        windowsClassificationsToInclude:[
            'Security'
            'Critical'
            'UpdateRollup'
            'FeaturePack'
            'ServicePack'
            'Definition'
            'Tools'
            'Updates'
        ]
        windowsExcludeKbsRequiringReboot: false
        windowsKbNumbersToExclude: []
        windowsKbNumbersToInclude: []
        rebootSetting: 'IfRequired'
        maintenanceScope: 'InGuestPatch'
        maintenanceWindowDuration: '02:00'
        maintenanceWindowExpirationDateTime: ''
        maintenanceWindowRecurEvery: '1Month Third Friday'
        maintenanceWindowStartDateTime: '2020-01-01 03:00' // Build variable in Main so only the Time is needed in Param file.
        maintenanceWindowTimeZone: 'W. Europe Standard Time'
    }
    maintenanceConfigurationMonthlyWaveOTwo: {
        maintenanceConfigurationSuffix: 'monthlyWaveTwo'
        inGuestPatchMode: 'user'
        linuxClassificationsToInclude: [
            'Security'
            'Critical'
            'Other'
        ]
        linuxPackageNameMasksToExclude: []
        linuxPackageNameMasksToInclude: []
        windowsClassificationsToInclude:[
            'Security'
            'Critical'
            'UpdateRollup'
            'FeaturePack'
            'ServicePack'
            'Definition'
            'Tools'
            'Updates'
        ]
        windowsExcludeKbsRequiringReboot: false
        windowsKbNumbersToExclude: []
        windowsKbNumbersToInclude: []
        rebootSetting: 'IfRequired'
        maintenanceScope: 'InGuestPatch'
        maintenanceWindowDuration: '02:00'
        maintenanceWindowExpirationDateTime: ''
        maintenanceWindowRecurEvery: '1Month Fourth Friday'
        maintenanceWindowStartDateTime: '2020-01-01 03:00' // Build variable in Main so only the Time is needed in Param file.
        maintenanceWindowTimeZone: 'W. Europe Standard Time'
    }
}
