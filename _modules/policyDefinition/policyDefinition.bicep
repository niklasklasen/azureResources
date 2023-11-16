targetScope = 'managementGroup'

param parPolicyName string
param parDescription string
param parDisplayName string
param parMetadata object
param parMode string
param parParameters object 
param parPolicyType string
param parPolicyRule object

resource resPolicyDefinitions 'Microsoft.Authorization/policyDefinitions@2021-06-01' = {
  name: parPolicyName
  properties: {
    description: parDescription
    displayName: parDisplayName
    metadata: parMetadata
    mode: parMode
    parameters: parParameters
    policyType: parPolicyType
    policyRule: parPolicyRule
  }
}
