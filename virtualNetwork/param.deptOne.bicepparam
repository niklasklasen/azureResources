using 'main.bicep'

param parDepartment = 'deptOne'
param parRegionShortName = 'sec'
param parLocation = 'swedencentral'
param parTags = {
  Department: 'One'
}
param parVnetAddressPrefix = ['10.0.1.0/24']
param parSubnets = [
  {
    name: 'frontend-snet'
    addressPrefix: '10.0.1.0/25'
  }
]
