targetScope = 'managementGroup'

//Parameters
param parPolicyAssignmentName string
param parPolicyAssignmentIdentityType string
param parPolicyAssignmentDescription string
param parPolicyAssignmentEnforcementMode string
param parPolicyAssignmentDefinitionId string
param parPolicyAssingmentParameters object
param parPolicyAssignmentLocation string
// Contributor Role Definition ID
param parRoleDefinitionId string = '/providers/microsoft.authorization/roleDefinitions/b24988ac-6180-42a0-ab88-20f7382dd24c'

// Resource
resource resPolicyAssignment 'Microsoft.Authorization/policyAssignments@2022-06-01' = {
  name: parPolicyAssignmentName
  identity: {
    type: parPolicyAssignmentIdentityType
  }
  properties: {
    description: parPolicyAssignmentDescription
    displayName: parPolicyAssignmentName
    enforcementMode: parPolicyAssignmentEnforcementMode
    policyDefinitionId: parPolicyAssignmentDefinitionId
    parameters: parPolicyAssingmentParameters
  }
  location: parPolicyAssignmentLocation 
}

resource resRoleAssignment 'Microsoft.Authorization/roleAssignments@2020-04-01-preview' = if (parPolicyAssignmentIdentityType == 'SystemAssigned') {
  name: guid(managementGroup().name, resPolicyAssignment.name, resPolicyAssignment.type)
  properties: {
    principalId: resPolicyAssignment.identity.principalId
    principalType: 'ServicePrincipal'
    roleDefinitionId: parRoleDefinitionId
  }
}

