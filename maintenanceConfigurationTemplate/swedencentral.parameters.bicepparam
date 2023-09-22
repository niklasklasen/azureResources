using 'main.bicep'

param parLocation = 'swedencentral'

param resourceGroups object = {
  resourceGroup1: {
    rgName: 'demoRG-1'
  },
  resourceGroup2: {
    param rgName: 'demoRG-2'
  }
}
