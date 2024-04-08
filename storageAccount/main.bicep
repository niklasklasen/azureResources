// Storage Account Deployment

targetScope = 'subscription'

// Parameters
param parEnvironmentName string
param parSolution string
param parLocation string
param parRegionShortName  string
param parTags object

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

param parDeployBlobService bool = true
param parDeployLifeCycleManagement bool =true

// Variables
var varUniqueString = take( uniqueString(subscription().id, modResourceGroup.outputs.outResourceGroupId), 6)
var varResourceGroupName = '${parEnvironmentName}-${parSolution}-${parRegionShortName}-rg'
var varStorageAccountName = '${parEnvironmentName}${parSolution}${parRegionShortName}${varUniqueString}st'

module modResourceGroup '../_modules/resourceGroup/resourceGroup.bicep' = {
  name: 'ResourceGroupDeployment'
  params: {
    parLocation: parLocation
    parResourceGroupName: varResourceGroupName
    parTags: parTags
  }
}

module modStorageAccount '../_modules/storageAccount/storageAccount.bicep' = {
  name: 'StorageAccountDeployment'
  scope: resourceGroup(varResourceGroupName)
  params: {
    parLocation: parLocation
    parDeployBlobService: parDeployBlobService
    parDeployLifeCycleManagement: parDeployLifeCycleManagement
    parSku: parSku
    parStorageAccountName: varStorageAccountName
  }
}
