using 'main.bicep'

var varTenantRootId = '4d7d49f0-57c4-41e8-86b7-74fe38a737a5'

// Management Groups, used for policy scope
var varMangmtGroupIds = {
  root: varTenantRootId
}

param parPolicyAssignments = [
  {
  definitionId: '/providers/Microsoft.Management/managementGroups/${varTenantRootId}/providers/Microsoft.Authorization/policySetDefinitions/Deploy-PeriodicAssessment'
  scope: varMangmtGroupIds.root
  name: 'Deploy-UpdateAssessment'
  description: 'Enables periodic update assessment on all type of machines that are represented in Azure.'
  displayName: 'Enable periodic assessment for all servers'
  enforcementMode: 'Default'
  idetityType: 'SystemAssigned'
  userAssignedIdentity: {}
  location: 'westeurope'
  parameters: {
    
  }
}
]
