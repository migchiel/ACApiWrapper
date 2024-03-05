Class {
	#name : #ArmorCodeTenant,
	#superclass : #Object,
	#instVars : [
		'apiKey',
		'request',
		'saasUrl',
		'connection'
	],
	#category : #'ACApiWrapper-Core'
}

{ #category : #'as yet unclassified' }
ArmorCodeTenant class >> connectTo: aUrl usingApiKey: anApiKey [

	| tenant |
	tenant := self basicNew.
	tenant
		url: aUrl;
		apiKey: anApiKey;initialize.
	^ tenant
]

{ #category : #'as yet unclassified' }
ArmorCodeTenant class >> connectUsingApiKey: anApiKey [

	^ self connectTo: self defaultTenant usingApiKey: anApiKey
]

{ #category : #'as yet unclassified' }
ArmorCodeTenant class >> defaultTenant [

	^ 'https://app.armorcode.com'
]

{ #category : #'instance creation' }
ArmorCodeTenant class >> new [

	^ self connectUsingApiKey: (Smalltalk os environment at: 'acapi_token')
]

{ #category : #accessing }
ArmorCodeTenant >> apiKey [
	^ apiKey
]

{ #category : #accessing }
ArmorCodeTenant >> apiKey: anApiKey [

	apiKey := anApiKey 
]

{ #category : #'as yet unclassified' }
ArmorCodeTenant >> basePath [

	^ ZnUrl fromString: saasUrl
]

{ #category : #'as yet unclassified' }
ArmorCodeTenant >> createPathFor: anEndpoint [

	^ self basePath + anEndpoint.
	
]

{ #category : #'as yet unclassified' }
ArmorCodeTenant >> getProducts [

	request := self createPathFor: '/user/product/elastic/paged'.
	request := request ? (#environmentName -> #STAGING)
	           & (#pageSize -> 20) & (#pageNumber -> 0) & (#tags -> #'')
	           & (#sortBy -> #NAME) & (#direction -> #ASC).
	connection url: request.
	^ connection get
]

{ #category : #'as yet unclassified' }
ArmorCodeTenant >> getSubProducts [

	request := self createPathFor: '/user/sub-product/elastic'.
	request := request ? (#environmentName -> #STAGING)
	           & (#pageSize -> 20) & (#pageNumber -> 0) & (#tags -> #'')
	           & (#sortBy -> #NAME) & (#direction -> #ASC).
	connection url: request.
	^ connection get
]

{ #category : #initialization }
ArmorCodeTenant >> initialize [

	connection := ACConnection new.
	connection authenticateUsing: apiKey
]

{ #category : #accessing }
ArmorCodeTenant >> url [
	^ saasUrl
]

{ #category : #accessing }
ArmorCodeTenant >> url: aUrl [

	saasUrl := aUrl
]
