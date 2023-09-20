// Resource Group must match the same reagion as in the Dynamic Scope Resource 
// extensionPreperties must include InGuestPatchMode

resource resMaintenanceConfiguration 'Microsoft.Maintenance/maintenanceConfigurations@2023-04-01' = {
  name: 't-dynscope-weu-mc-03'
  location: 'westeurope'
  tags: {
    environment: 'test'
    }
  properties: {
    extensionProperties: {
      InGuestPatchMode: 'user'
    }
    installPatches: {
      linuxParameters: {
        classificationsToInclude: [
          'Critical'
          'Security'
        ]
        packageNameMasksToExclude: null
        packageNameMasksToInclude: null
      }
      rebootSetting: 'IfRequired'
      windowsParameters: {
        classificationsToInclude: [
          'Critical'
          'Security'
        ]
        excludeKbsRequiringReboot: false
        kbNumbersToExclude: null
        kbNumbersToInclude: null
      }
    }
    maintenanceScope: 'InGuestPatch'
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

resource resDynamicScope 'Microsoft.Maintenance/configurationAssignments@2023-04-01' = {
  name: 't-dynscope-weu-dynscope-03'
  location: 'westeurope'
  properties: {
    filter: {
      locations: [
        'swedencentral'
        'westeurope'
      ]
      osTypes: [
        'Linux'
        'Windows'
      ]
      resourceGroups: []
      resourceTypes: [
        'microsoft.hybridcompute/machines'
      ]
    }
    maintenanceConfigurationId: resMaintenanceConfiguration.id
  }
}
