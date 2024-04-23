targetScope = 'subscription'

param parSolution string
param parLocation string
param parRegionShortName  string
param parTags object
param parVnetAddressPrefix array
param parSubnets array
param parCustomDnsServer array = ['168.63.129.16']

var varUniqueString = take( uniqueString(subscription().id, modResourceGroup.outputs.outResourceGroupId), 6)
var varResourceGroupName = '${parSolution}-${parRegionShortName}-rg'
var varVirtualNetworkName = '${parSolution}-${parRegionShortName}-vnet'
var varStorageAccountName = '${parEnvironmentName}${parSolution}${parRegionShortName}${varUniqueString}st'

module modResourceGroup '../_modules/resourceGroup/resourceGroup.bicep' = {
  name: '${varResourceGroupName}-Deployment'
  params: {
    parLocation: parLocation
    parResourceGroupName: varResourceGroupName
    parTags: parTags
  }
}

module modVirtualNetwork '../_modules/virtualNetwork/virtualNetwork.bicep' = {
  scope: resourceGroup(varResourceGroupName)
  name: '${varVirtualNetworkName}-Deployment'
  params: {
    parAddressPrefix: parVnetAddressPrefix
    parCustomDnsServer: parCustomDnsServer
    parLocation: parLocation
    parSubnets: parSubnets
    parTags: parTags
    parVnetName: varVirtualNetworkName
  }
}
