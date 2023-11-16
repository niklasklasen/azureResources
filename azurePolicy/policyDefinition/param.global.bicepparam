using 'main.bicep'

var varPolicySetDefinitionDeployPeriodicAssessmentParameters = loadJsonContent('policySetDefinitions/policySetDefinition_Deploy-periodicAssessment.parameters.json')

param parPolicySetDefinition = [
  {
    name: 'Deploy-periodicAssessment'
    libSetDefinition: loadJsonContent('policySetDefinitions/policySetDefinition_Deploy-periodicAssessment.json')
    libSetChildDefinitions: [
      {
        definitionReferenceId: 'AssessmentWindowsArc'
        definitionId: '/providers/Microsoft.Authorization/policyDefinitions/bfea026e-043f-4ff4-9d1b-bf301ca7ff46'
        definitionParameters: varPolicySetDefinitionDeployPeriodicAssessmentParameters.AssessmentWindowsArc.parameters
        definitionGroups: []
      }
      {
        definitionReferenceId: 'AssessmentLinuxArc'
        definitionId: '/providers/Microsoft.Authorization/policyDefinitions/bfea026e-043f-4ff4-9d1b-bf301ca7ff46'
        definitionParameters: varPolicySetDefinitionDeployPeriodicAssessmentParameters.AssessmentLinuxArc.parameters
        definitionGroups: []
      }
      {
        definitionReferenceId: 'AssessmentWindowsVM'
        definitionId: '/providers/Microsoft.Authorization/policyDefinitions/bfea026e-043f-4ff4-9d1b-bf301ca7ff46'
        definitionParameters: varPolicySetDefinitionDeployPeriodicAssessmentParameters.AssessmentWindowsVM.parameters
        definitionGroups: []
      }
      {
        definitionReferenceId: 'AssessmentLinuxVM'
        definitionId: '/providers/Microsoft.Authorization/policyDefinitions/bfea026e-043f-4ff4-9d1b-bf301ca7ff46'
        definitionParameters: varPolicySetDefinitionDeployPeriodicAssessmentParameters.AssessmentLinuxVM.parameters
        definitionGroups: []
      }
    ]
  }
]
