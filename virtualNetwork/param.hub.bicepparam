using 'main.bicep'

param parDepartment = 'hub'
param parRegionShortName = 'sec'
param parLocation = 'swedencentral'
param parTags = {
  Department: 'HUB'
}
param parVnetAddressPrefix = ['10.0.0.0/24']
param parSubnets = []
