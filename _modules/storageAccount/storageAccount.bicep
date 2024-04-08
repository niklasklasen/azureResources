// Parameters
@description('Specifies the name of the Storage Account')
param parStorageAccountName string

@description('Specifies the location of the Storage Account')
param parLocation string

@description('Select Storage Account SKU')
@allowed([
  'Premium_LRS'
  'Premium_ZRS'
  'Standard_GRS'
  'Standard_GZRS'
  'Standard_LRS'
  'Standard_RAGRS'
  'Standard_RAGZRS'
  'Standard_ZRS'
])
param parSku string 

param parDeployBlobService bool = false
param parRetentionInDays int = 7
param parRetentionEnabled bool = true

param parDeployLifeCycleManagement bool = false
param parDeleteBlobsAfterDays int = 90
param parLifeCycleManagementRuleName string = 'BlobDelete90Days'

// Resources
resource resStorageAccount 'Microsoft.Storage/storageAccounts@2021-01-01' = {
  name: parStorageAccountName
  location: parLocation
  kind: 'StorageV2'
  sku: {
    name: parSku
  }
  properties: {
    minimumTlsVersion: 'TLS1_2'
    supportsHttpsTrafficOnly: true
  }
}

resource resBlobService 'Microsoft.Storage/storageAccounts/blobServices@2023-01-01' = if (parDeployBlobService) {
  name: 'default'
  parent: resStorageAccount
  properties: {
    containerDeleteRetentionPolicy: {
      days: parRetentionInDays
      enabled: parRetentionEnabled
    }
    deleteRetentionPolicy: {
      allowPermanentDelete: false
      days: parRetentionInDays
      enabled: parRetentionEnabled
    }
  }
}

resource symbolicname 'Microsoft.Storage/storageAccounts/managementPolicies@2023-01-01' = if (parDeployLifeCycleManagement) {
  name: 'default'
  parent: resStorageAccount
  properties: {
    policy: {
      rules: [
        {
          definition: {
            actions: {
              baseBlob: {
                delete: {
                  daysAfterModificationGreaterThan: parDeleteBlobsAfterDays
                }
              }
            }
            filters: {
              blobTypes: [
                'blockBlob'
              ]
            }
          }
          enabled: true
          name: parLifeCycleManagementRuleName
          type: 'Lifecycle'
        }
      ]
    }
  }
}

// Output
output outStorageAccountId string = resStorageAccount.id
output outStorageAccountName string = resStorageAccount.name
