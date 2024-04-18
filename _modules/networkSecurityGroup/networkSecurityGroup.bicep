// Parametes
param parNetworkSecurityGroupName string
param parLocation string
param parTags object

//Resources
resource resNetworkSecurityGroup 'Microsoft.Network/networkSecurityGroups@2023-09-01' = {
  name: parNetworkSecurityGroupName
  location: parLocation
  tags: parTags
}

// Output
output outNetworkSecurityGroupId string = resNetworkSecurityGroup.id
output outNetworkSecurityGroupName string = resNetworkSecurityGroup.name
