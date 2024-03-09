Class {
	#name : #ArmorCodeTenant,
	#superclass : #Object,
	#instVars : [
		'apiKey',
		'request',
		'connection',
		'url'
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

	^ ZnUrl fromString: url
]

{ #category : #accessing }
ArmorCodeTenant >> body: aPayload [

	connection body: aPayload 
]

{ #category : #'as yet unclassified' }
ArmorCodeTenant >> createPathForRequest: anEndpoint [

	^ request := self basePath + anEndpoint
]

{ #category : #'as yet unclassified' }
ArmorCodeTenant >> getAlerts [

	^ connection get: '/api/alerts' asZnUrl.

]

{ #category : #'as yet unclassified' }
ArmorCodeTenant >> getAuditLogs [

	^ connection get: '/user/audit/log/details/page' asZnUrl 
	           ? (#page -> 0) & (#size -> 10)
	           & (#revisionType -> 'LOGGED_IN').

]

{ #category : #'as yet unclassified' }
ArmorCodeTenant >> getFeatureFlags [

	^ connection get:  '/user/feature-flag' asZnUrl 

]

{ #category : #'as yet unclassified' }
ArmorCodeTenant >> getFindings [

	^ connection post: '/user/findings/' asZnUrl withPayload: (NeoJSONObject fromString:
			 '{"page":0,"size":100,"sort":"","sortColumns":[],"filters":{},"ticketStatusRequired":true,"ignoreMitigated":null,"ignoreDuplicate":true}')
]

{ #category : #'as yet unclassified' }
ArmorCodeTenant >> getProductTypes [

	^ connection get: '/user/product-type' asZnUrl 

]

{ #category : #'as yet unclassified' }
ArmorCodeTenant >> getProducts [

	^ connection get:
		  ('/user/product/elastic/paged' asZnUrl
		  ? (#environmentName -> #STAGING) & (#pageSize -> 20)
		  & (#pageNumber -> 0) & (#tags -> #'') & (#sortBy -> #NAME)
		  & (#direction -> #ASC))
]

{ #category : #'as yet unclassified' }
ArmorCodeTenant >> getSessionDetails [

^ connection get: '/user/details/session' asZnUrl 

]

{ #category : #'as yet unclassified' }
ArmorCodeTenant >> getSubProductTypes [

	^ connection get: '/user/sub-product-type' asZnUrl.
	
]

{ #category : #'as yet unclassified' }
ArmorCodeTenant >> getSubProducts [

 ^ connection get: '/user/sub-product/elastic' asZnUrl 
	           ? (#environmentName -> #STAGING) & (#pageSize -> 20)
	           & (#pageNumber -> 0) & (#tags -> #'') & (#sortBy -> #NAME)
	           & (#direction -> #ASC)
]

{ #category : #'as yet unclassified' }
ArmorCodeTenant >> getTeams [

	^ connection get: '/api/team/all-teams' asZnUrl 
	
]

{ #category : #'as yet unclassified' }
ArmorCodeTenant >> getUsers [

	^ connection get: '/user/data/users' asZnUrl
	
]

{ #category : #initialization }
ArmorCodeTenant >> initialize [

	connection := ACConnection for: self
]

{ #category : #accessing }
ArmorCodeTenant >> url [
	^ url
]

{ #category : #accessing }
ArmorCodeTenant >> url: aUrl [

	url := aUrl
]
