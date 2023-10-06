# Deployment Command
New-AzSubscriptionDeployment -Name 'MaintConfigTest' -Location 'swedencentral' -TemplateFile .\maintenanceConfiguration\main.bicep -TemplateParameterFile .\maintenanceConfiguration\param.swedencentral.bicepparam

# Description
Will deploy the following: 
- Maintenance Configuration for Daily Definition updates
- Maintenance Configuration for Monthly Security & Critical Updates (based on Microsoft's 'Patch Tuesday')
- 3 Maintenance Configurations for ALL Updates 
    - 1 for Pilot Servers 
    - 1 for Wave 1
    - 1 for Wave 2