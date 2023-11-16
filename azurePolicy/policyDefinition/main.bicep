targetScope = 'managementGroup'

param parPolicySetDefinition array

module modPolicySetDefinition '../../_modules/policySetDefinition/policySetDefinition.bicep' = [for policySet in parPolicySetDefinition: {
  name: '${policySet.libSetDefinition.name}-Deployment'
  params: {
    parPolicySetChildDefinitions: policySet.libSetChildDefinitions
    parPolicySetDescription: policySet.libSetDefinition.properties.description
    parPolicySetDefinitionGroups: policySet.libSetDefinition.properties.policyDefinitionGroups
    parPolicySetDisplayName: policySet.libSetDefinition.properties.displayName
    parPolicySetMetadata: policySet.libSetDefinition.properties.metadata
    parPolicySetName: policySet.libSetDefinition.name
    parPolicySetParameters: policySet.libSetDefinition.properties.parameters
    parPolicySetType: policySet.libSetDefinition.properties.policyType
  }
}]
