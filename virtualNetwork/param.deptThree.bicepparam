using 'main.bicep'

param parDepartment = 'deptThree'
param parRegionShortName = 'sec'
param parLocation = 'swedencentral'
param parTags = {
  Department: 'Three'
}
param parVnetAddressPrefix = ['10.0.3.0/24']
param parSubnets = [
  {
    name: 'frontend-snet'
    addressPrefix: '10.0.3.0/25'
  }
  {
    name: 'backend-snet'
    addressPrefix: '10.0.3.128/25'
  }
]
