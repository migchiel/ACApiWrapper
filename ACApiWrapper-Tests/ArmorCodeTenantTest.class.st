"
An ArmorCodeTenantTest is a test class for testing the behavior of ArmorCodeTenant
"
Class {
	#name : #ArmorCodeTenantTest,
	#superclass : #TestCase,
	#category : #'ACApiWrapper-Tests-Core'
}

{ #category : #tests }
ArmorCodeTenantTest >> testCreateUsingNew [
	| tenant |

	tenant := ArmorCodeTenant new.
	self assert: tenant url equals: ArmorCodeTenant defaultTenant.
	self assert: tenant apiKey equals: (Smalltalk os environment at: 'acapi_token')
]

{ #category : #tests }
ArmorCodeTenantTest >> testCreateWithUrl [

	| tenant apiKey url |
	apiKey := 'Some-Api-Key'.
	url := 'https://qa.armorcode.io'.
	tenant := ArmorCodeTenant connectTo: url usingApiKey: apiKey.
	self assert: tenant url equals: url.
	self assert: tenant apiKey equals: apiKey.
	
]

{ #category : #tests }
ArmorCodeTenantTest >> testCreateWithoutUrl [

	| tenant apiKey |
	apiKey := 'Some-Api-Key'.
	tenant := ArmorCodeTenant connectUsingApiKey: apiKey.
	self assert: tenant url equals: ArmorCodeTenant defaultTenant.
	self assert: tenant apiKey equals: apiKey
]
