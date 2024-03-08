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

{ #category : #accessing }
ArmorCodeTenant >> body: aPayload [

	connection body: aPayload 
]

{ #category : #'as yet unclassified' }
ArmorCodeTenant >> createPathForRequest: anEndpoint [

	^ request := self basePath + anEndpoint
]

{ #category : #'as yet unclassified' }
ArmorCodeTenant >> delete [

	^ connection
		  url: request;
		  method: #DELETE;
		  executeRequest
]

{ #category : #'as yet unclassified' }
ArmorCodeTenant >> get [

	^ connection
		  url: request;
		  method: #GET;
		  executeRequest
]

{ #category : #'as yet unclassified' }
ArmorCodeTenant >> getAlerts [

	request := (self createPathForRequest: '/api/alerts').
	^ self get
]

{ #category : #'as yet unclassified' }
ArmorCodeTenant >> getAuditLogs [

	request := (self createPathForRequest: '/user/audit/log/details/page') ? (#page -> 0) & (#size -> 10) & (#revisionType -> 'LOGGED_IN').
	^ self get
]

{ #category : #'as yet unclassified' }
ArmorCodeTenant >> getFeatureFlags [

	request := self createPathForRequest: '/user/feature-flag'.
	^ self get
]

{ #category : #'as yet unclassified' }
ArmorCodeTenant >> getFindings [

	request := self createPathForRequest: '/user/findings/'.
	self body: (NeoJSONObject fromString: '{"page":0,"size":100,"sort":"","sortColumns":[],"filters":{},"ticketStatusRequired":true,"ignoreMitigated":null,"ignoreDuplicate":true}').
	^ self post
]

{ #category : #'as yet unclassified' }
ArmorCodeTenant >> getProductTypes [

	request := self createPathForRequest: '/user/product-type'.
	^ self get
]

{ #category : #'as yet unclassified' }
ArmorCodeTenant >> getProducts [

	request := (self createPathForRequest:
		           '/user/product/elastic/paged')
		           ? (#environmentName -> #STAGING) & (#pageSize -> 20)
		           & (#pageNumber -> 0) & (#tags -> #'')
		           & (#sortBy -> #NAME) & (#direction -> #ASC).
	^ self get
]

{ #category : #'as yet unclassified' }
ArmorCodeTenant >> getSubProductTypes [

	request := self createPathForRequest: '/user/sub-product-type'.
	^ self get
]

{ #category : #'as yet unclassified' }
ArmorCodeTenant >> getSubProducts [

	request := (self createPathForRequest:
		           '/user/sub-product/elastic')
		           ? (#environmentName -> #STAGING) & (#pageSize -> 20)
		           & (#pageNumber -> 0) & (#tags -> #'')
		           & (#sortBy -> #NAME) & (#direction -> #ASC).
	^ self get
]

{ #category : #initialization }
ArmorCodeTenant >> initialize [

	connection := ACConnection new.
	connection authenticateUsing: apiKey
]

{ #category : #'as yet unclassified' }
ArmorCodeTenant >> post [

	^ connection
		  url: request;
		  method: #POST;
		  executeRequest
]

{ #category : #'as yet unclassified' }
ArmorCodeTenant >> put [

	^ connection
		  url: request;
		  method: #PUT;
		  executeRequest
]

{ #category : #accessing }
ArmorCodeTenant >> url [
	^ saasUrl
]

{ #category : #accessing }
ArmorCodeTenant >> url: aUrl [

	saasUrl := aUrl
]
