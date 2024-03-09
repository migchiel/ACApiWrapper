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

{ #category : #'API - Product' }
ArmorCodeTenant >> createProducts: aProductOrCollection [

	| products |
	aProductOrCollection isCollection
		ifTrue: [ products := aProductOrCollection ]
		ifFalse: [ products := Array with: aProductOrCollection ].
	^ products collect: [ :product | 
		  connection post: '/user/product' withPayload: product ]
]

{ #category : #'API - Audit & Alerts' }
ArmorCodeTenant >> getAlerts [

	^ connection get: '/api/alerts'
]

{ #category : #'API - Audit & Alerts' }
ArmorCodeTenant >> getAuditLogs [

	^ connection get:
		  '/user/audit/log/details/page' withQuery: {#page -> 0 . #size -> 100}
]

{ #category : #'API - Misc' }
ArmorCodeTenant >> getFeatureFlags [

	^ connection get: '/user/feature-flag'
]

{ #category : #'API - Findings' }
ArmorCodeTenant >> getFindings [

	^ connection
		  post: '/user/findings/'
		  withPayload: (NeoJSONObject fromString:
				   '{"page":0,"size":100,"sort":"","sortColumns":[],"filters":{},"ticketStatusRequired":true,"ignoreMitigated":null,"ignoreDuplicate":true}')
]

{ #category : #'API - Audit & Alerts' }
ArmorCodeTenant >> getLogins [

	^ connection get: '/user/audit/log/details/page' withQuery: { 
			  (#revisionType -> 'LOGGED_IN').
			  (#page -> 0).
			  (#size -> 10) }
]

{ #category : #'API - Product' }
ArmorCodeTenant >> getProductTypes [

	^ connection get: '/user/product-type'
]

{ #category : #'API - Product' }
ArmorCodeTenant >> getProducts [

	^ connection get:
		  '/user/product/elastic/paged' withQuery: { #environmentName -> #STAGING . #pageSize -> 20 . #pageNumber -> 0 . #tags -> #'' . #sortBy -> #NAME . #direction -> #ASC}
]

{ #category : #'API - Misc' }
ArmorCodeTenant >> getSessionDetails [

	^ connection get: '/user/details/session' 
]

{ #category : #'API - Sub Product' }
ArmorCodeTenant >> getSubProductTypes [

	^ connection get: '/user/sub-product-type'
]

{ #category : #'API - Sub Product' }
ArmorCodeTenant >> getSubProducts [

	^ connection get:
		  '/user/sub-product/elastic' withQuery: 
		  { #environmentName -> #STAGING . #pageSize -> 20 .
		  #pageNumber -> 0 . #tags -> #'' . #sortBy -> #NAME . #direction -> #ASC}
]

{ #category : #'API - Users & Teams' }
ArmorCodeTenant >> getTeams [

	^ connection get: '/api/team/all-teams'
]

{ #category : #'API - Users & Teams' }
ArmorCodeTenant >> getUsers [

	^ connection get: '/user/data/users'
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
