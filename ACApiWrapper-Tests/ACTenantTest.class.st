"
An ArmorCodeTenantTest is a test class for testing the behavior of ArmorCodeTenant
"
Class {
	#name : #ACTenantTest,
	#superclass : #TestCase,
	#category : #'ACApiWrapper-Tests-Core'
}

{ #category : #tests }
ACTenantTest >> testCreateUsingNew [
	| tenant |

	tenant := ACTenant new.
	self assert: tenant url equals: ACTenant defaultTenant.
	self assert: tenant apiKey equals: (Smalltalk os environment at: 'acapi_token')
]

{ #category : #tests }
ACTenantTest >> testCreateWithUrl [

	| tenant apiKey url |
	apiKey := 'Some-Api-Key'.
	url := 'https://qa.armorcode.io'.
	tenant := ACTenant connectTo: url usingApiKey: apiKey.
	self assert: tenant url equals: url.
	self assert: tenant apiKey equals: apiKey.
	
]

{ #category : #tests }
ACTenantTest >> testCreateWithoutUrl [

	| tenant apiKey |
	apiKey := 'Some-Api-Key'.
	tenant := ACTenant connectUsingApiKey: apiKey.
	self assert: tenant url equals: ACTenant defaultTenant.
	self assert: tenant apiKey equals: apiKey
]
