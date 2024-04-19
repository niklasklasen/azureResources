using 'main.bicep'

param parDepartment = 'deptTwo'
param parRegionShortName = 'sec'
param parLocation = 'swedencentral'
param parTags = {
  Department: 'Two'
}
param parVnetAddressPrefix = ['10.0.2.0/24']
param parSubnets = [
  {
    name: 'frontend-snet'
    addressPrefix: '10.0.2.0/25'
  }
  {
    name: 'backend-snet'
    addressPrefix: '10.0.2.128/25'
  }
]
