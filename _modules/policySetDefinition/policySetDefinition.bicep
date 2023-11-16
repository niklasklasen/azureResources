targetScope = 'managementGroup'

param parPolicySetName string
param parPolicySetDescription string
param parPolicySetDisplayName string
param parPolicySetMetadata object
param parPolicySetParameters object
param parPolicySetType string
param parPolicySetChildDefinitions array
param parPolicySetDefinitionGroups array

resource resPolicySetDefinitions 'Microsoft.Authorization/policySetDefinitions@2021-06-01' = {
  name: parPolicySetName
  properties: {
    description: parPolicySetDescription
    displayName: parPolicySetDisplayName
    metadata: parPolicySetMetadata
    parameters: parPolicySetParameters
    policyType: parPolicySetType
    policyDefinitions: [for policyDefinition in parPolicySetChildDefinitions: {
      policyDefinitionReferenceId: policyDefinition.definitionReferenceId
      policyDefinitionId: policyDefinition.definitionId
      parameters: policyDefinition.definitionParameters
      groupNames: policyDefinition.definitionGroups
    }]
    policyDefinitionGroups: parPolicySetDefinitionGroups
  }
}
