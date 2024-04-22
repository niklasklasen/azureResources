targetScope = 'subscription'

// Parameters
param parSolutiont string
param parRegionShortName string
param parLocation string
param parTags object
param parSubnets array = []
param parCustomDNS array = ['168.63.129.16']
param parVnetAddressPrefix array

// Variables
var varResourceGroupName = '${parSolutiont}-${parRegionShortName}-rg'
var varVirtualNetworkName = '${parSolutiont}-${parRegionShortName}-vnet'

// Modules
module modResourceGroup '../_modules/resourceGroup/resourceGroup.bicep' = {
  name: 'ResourceGroup-Deployment'
  params: {
    parLocation: parLocation
    parResourceGroupName: varResourceGroupName
    parTags: parTags
  }
}

module modVirtualNetwork '../_modules/virtualNetwork/virtualNetwork.bicep' = {
  scope: resourceGroup(varResourceGroupName)
  dependsOn: [
    modResourceGroup
  ]
  name: 'vnet-Deployment'
  params: {
    parAddressPrefix: parVnetAddressPrefix
    parCustomDnsServer: parCustomDNS
    parLocation: parLocation
    parSubnets: parSubnets
    parTags: parTags
    parVnetName: varVirtualNetworkName
  }
}


