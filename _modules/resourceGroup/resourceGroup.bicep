targetScope = 'subscription'

// Parameters
param parResourceGroupName string
param parLocation string
param parTags object

// Resources
resource resResourceGroup 'Microsoft.Resources/resourceGroups@2022-09-01' = {
  name: parResourceGroupName
  location: parLocation
  tags: parTags
}

// Output
output outResourceGroupName string = resResourceGroup.name
output outResourceGroupId string = resResourceGroup.id
