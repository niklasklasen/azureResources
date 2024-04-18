// Parameters
param parVnetName string
param parLocation string
param parTags object
param parAddressPrefix array
param parSubnets array
param parCustomDnsServer array

// Resources

//Resources
resource resNetworkSecurityGroup 'Microsoft.Network/networkSecurityGroups@2023-09-01' = [for subnet in parSubnets: {
  name: '${subnet.name}-nsg'
  location: parLocation
  tags: parTags
}]

resource resVirtualNetwork 'Microsoft.Network/virtualNetworks@2023-09-01' = {
  name: parVnetName
  location: parLocation
  tags: parTags
  properties: {
    addressSpace: {
      addressPrefixes: parAddressPrefix
    }
    dhcpOptions: {
      dnsServers: parCustomDnsServer
    }
    subnets: [ for (subnet,i) in parSubnets: {
      name: subnet.name
      properties: {
        addressPrefix: subnet.addressPrefix
        networkSecurityGroup: {
          id: resNetworkSecurityGroup[i].id
        }
      }
    }]
  }
}

// Output
output outVirtualNetworkId string = resVirtualNetwork.id
output outVirtualNetworkName string = resVirtualNetwork.name
