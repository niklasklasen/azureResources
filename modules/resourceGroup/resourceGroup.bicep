targetScope = 'subscription'

param parResourceGroupName string
param parResourceGroupLocation string
param parResourceGroupTags object

resource resResourceGroup 'Microsoft.Resources/resourceGroups@2022-09-01' = {
  name: parResourceGroupName
  location: parResourceGroupLocation
  tags: parResourceGroupTags
  properties: {}
}
