using 'main.bicep'

param parEnvironmentName = 'p'
param parSolution = 'patchmgmt'
param parLocation = 'swedencentral'
param parRegionShortName = 'sec'
param parTags = {
    environment: 'production'
}

var varTimeZone = 'W. Europe Standard Time'
var varDefaultStartDate = '2020-01-01'


param parMaintenanceConfigurations = {
    maintenanceConfigurationDailyDefinitions: {
        maintenanceConfigurationSuffix: 'dailyDefinitions'
        linuxClassificationsToInclude: []
        windowsClassificationsToInclude:[
            'Definition'
        ]
        windowsExcludeKbsRequiringReboot: false
        rebootSetting: 'Never'
        maintenanceWindowDuration: '02:00'
        maintenanceWindowRecurEvery: '1Day'
        maintenanceWindowStartDateTime: '${varDefaultStartDate} 03:00'
        maintenanceWindowTimeZone: varTimeZone
    }
    maintenanceConfigurationMonthlySecurityCritical: {
        maintenanceConfigurationSuffix: 'monthlySecurityCritical'
        linuxClassificationsToInclude: [
            'Security'
            'Critical'
        ]
        windowsClassificationsToInclude:[
            'Security'
            'Critical'
        ]
        windowsExcludeKbsRequiringReboot: false
        rebootSetting: 'IfRequired'
        maintenanceWindowDuration: '02:00'
        maintenanceWindowRecurEvery: '1Month Second Tuesday Offset1'
        maintenanceWindowStartDateTime: '${varDefaultStartDate} 03:00'
        maintenanceWindowTimeZone: varTimeZone
    }
    maintenanceConfigurationMonthlyPilot: {
        maintenanceConfigurationSuffix: 'monthlyPilot'
        linuxClassificationsToInclude: [
            'Security'
            'Critical'
            'Other'
        ]
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
        rebootSetting: 'IfRequired'
        maintenanceWindowDuration: '02:00'
        maintenanceWindowRecurEvery: '1Month Second Friday'
        maintenanceWindowStartDateTime: '${varDefaultStartDate} 03:00'
        maintenanceWindowTimeZone: varTimeZone
    }
    maintenanceConfigurationMonthlyWaveOne: {
        maintenanceConfigurationSuffix: 'monthlyWaveOne'
        linuxClassificationsToInclude: [
            'Security'
            'Critical'
            'Other'
        ]
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
        rebootSetting: 'IfRequired'
        maintenanceWindowDuration: '02:00'
        maintenanceWindowRecurEvery: '1Month Third Friday'
        maintenanceWindowStartDateTime: '${varDefaultStartDate} 03:00'
        maintenanceWindowTimeZone: varTimeZone
    }
    maintenanceConfigurationMonthlyWaveOTwo: {
        maintenanceConfigurationSuffix: 'monthlyWaveTwo'
        linuxClassificationsToInclude: [
            'Security'
            'Critical'
            'Other'
        ]
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
        rebootSetting: 'IfRequired'
        maintenanceWindowDuration: '02:00'
        maintenanceWindowRecurEvery: '1Month Fourth Friday'
        maintenanceWindowStartDateTime: '${varDefaultStartDate} 03:00'
        maintenanceWindowTimeZone: varTimeZone
    }
}
