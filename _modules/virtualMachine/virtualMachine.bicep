// Parameters
param parLocation string
param parTags object

// Storage Account Parameters
param parDiagnosticStorageAccountName string

// NIC Parameters
param parNicName string
param parSubnetId string
param parPublicIpAddressId string

// Virtual Machine Parameters
param parVirtualMachineName string
param parVmSize string
param parAdminUsername string
@secure()
param parAdminPassword string
param parImagePublisher string
param parImageOffer string
param parWindowsOSVersion string
param parComputerNameName string
param parDataDiskSizeGB int

// Resources
resource resStorageAccount 'Microsoft.Storage/storageAccounts@2021-04-01' = {
  name: parDiagnosticStorageAccountName
  location: parLocation
  tags: parTags
  kind: 'StorageV2'
  sku: {
    name: 'Standard_LRS'
  }
}

resource resNic 'Microsoft.Network/networkInterfaces@2021-02-01' = {
  name: parNicName
  location: parLocation
  tags: parTags
  properties: {
    ipConfigurations: [
      {
        name: 'ipconfig1'
        properties: {
          privateIPAllocationMethod: 'Dynamic'
          subnet: {
            id: parSubnetId
          }
          publicIPAddress: {
            id: parPublicIpAddressId
          }
        }
      }
    ]
  }
}

resource virtualMachine 'Microsoft.Compute/virtualMachines@2021-03-01' = {
  name: parVirtualMachineName
  location: parLocation
  tags: parTags
  properties: {
    hardwareProfile: {
      vmSize: parVmSize
    }
    osProfile: {
      computerName: parComputerNameName
      adminUsername: parAdminUsername
      adminPassword: parAdminPassword
    }
    storageProfile: {
      imageReference: {
        publisher: parImagePublisher
        offer: parImageOffer
        sku: parWindowsOSVersion
        version: 'latest'
      }
      osDisk: {
        name: '${parVirtualMachineName}-OsDisk'
        caching: 'ReadWrite'
        createOption: 'FromImage'
      }
      dataDisks: [
        {
          name: '${parVirtualMachineName}-DataDisk'
          caching: 'None'
          createOption: 'Empty'
          diskSizeGB: parDataDiskSizeGB
          lun: 0
        }
      ]
    }
    networkProfile: {
      networkInterfaces: [
        {
          id: resNic.id
        }
      ]
    }
    diagnosticsProfile: {
      bootDiagnostics: {
        enabled: true
        storageUri: resStorageAccount.properties.primaryEndpoints.blob
      }
    }
  }
}
