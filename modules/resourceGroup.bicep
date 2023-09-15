targetScope = 'subscription'

param resourceGroupName string
param resourceGroupLocation string
param resourceGroupTags object


resource resResourceGroup 'Microsoft.Resources/resourceGroups@2022-09-01' = {
  name: resourceGroupName
  location: resourceGroupLocation
  tags: resourceGroupTags
  properties: {}
}
