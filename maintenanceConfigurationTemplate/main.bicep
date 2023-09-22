targetScope = 'subscription'

param parLocation string

param resourceGroups object
param rgName string

module modResourceGroup '../modules/resourceGroup/resourceGroup.bicep' = [for rg in items(resourceGroups): {
  name: rg.value.rgName
  params: {
    parResourceGroupLocation: parLocation
    parResourceGroupName: rg.value.rgName
    parResourceGroupTags: {}
  }
}]
