using 'main.bicep'

param parSolution = 'vnet'
param parRegionShortName = 'sec'
param parLocation = 'swedencentral'
param parTags = {
  environment: 'test'
}
param parVnetAddressPrefix = ['10.0.0.0/24']
param parSubnets = [
  {
    name: 'frontend-snet'
    addressPrefix: '10.0.0.0/25'
  }
  {
    name: 'backend-snet'
    addressPrefix: '10.0.0.128/25'
  }
]
