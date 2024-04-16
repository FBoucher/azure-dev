metadata description = 'Creates an Windows or Linux Azure App Service plan.'
param name string
param location string = resourceGroup().location
param tags object = {}

param sku object

@allowed(['Windows', 'Linux'])
param OperatingSystem string = 'Linux'

var servicePlanProperties = (OperatingSystem == 'Linux') ? {reserved: true} : {computeMode: 'Dynamic'}
var kind = (OperatingSystem == 'Linux') ? 'Linux' : ''

resource appServicePlan 'Microsoft.Web/serverfarms@2022-03-01' = {
  name: name
  location: location
  tags: tags
  sku: sku
  kind: kind
  properties: servicePlanProperties
}

output id string = appServicePlan.id
output name string = appServicePlan.name
