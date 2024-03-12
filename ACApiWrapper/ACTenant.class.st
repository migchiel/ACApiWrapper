Class {
	#name : #ACTenant,
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
ACTenant class >> connectTo: aUrl usingApiKey: anApiKey [

	| tenant |
	tenant := self basicNew.
	tenant
		url: aUrl;
		apiKey: anApiKey;initialize.
	^ tenant
]

{ #category : #'as yet unclassified' }
ACTenant class >> connectUsingApiKey: anApiKey [

	^ self connectTo: self defaultTenant usingApiKey: anApiKey
]

{ #category : #'as yet unclassified' }
ACTenant class >> defaultTenant [

	^ 'https://app.armorcode.com'
]

{ #category : #'instance creation' }
ACTenant class >> new [

	^ self connectUsingApiKey: (Smalltalk os environment at: 'acapi_token')
]

{ #category : #accessing }
ACTenant >> apiKey [
	^ apiKey
]

{ #category : #accessing }
ACTenant >> apiKey: anApiKey [

	apiKey := anApiKey 
]

{ #category : #'API - Business Unit' }
ACTenant >> createBusinessUnit: aBusinessUnitOrCollection [

	^ self createItems: '/user/business-unit' items: aBusinessUnitOrCollection 
	
]

{ #category : #accessing }
ACTenant >> createItems: aUrl items: anItemOrItemCollection [

	| items |
	items := self ensureCollection: anItemOrItemCollection.
	^ items collect: [ :item | connection post: aUrl withPayload: item ]
]

{ #category : #'API - Product' }
ACTenant >> createProducts: aProductOrCollection [

	^ self createItems: '/user/product' items: aProductOrCollection
]

{ #category : #'API - Sub Product' }
ACTenant >> createSubProducts: anItemOrCollection [

	^ self createItems: '/user/sub-product' items: anItemOrCollection 
]

{ #category : #accessing }
ACTenant >> deleteItems: aUrl items: anItemOrItemCollection [

	| items |
	items := self ensureCollection: anItemOrItemCollection.
	^ items collect: [ :item | 
		  connection delete: aUrl , item id asString ]
]

{ #category : #'API - Product' }
ACTenant >> deleteProducts: aProductOrCollection [

	^ self deleteItems: '/user/product/' items: aProductOrCollection  
		  
]

{ #category : #'API - Sub Product' }
ACTenant >> deleteSubProducts: anItemOrCollection [

	^ self deleteItems: '/user/sub-product/' items: anItemOrCollection 
]

{ #category : #validating }
ACTenant >> ensureCollection: anItemOrItemCollection [

	^ anItemOrItemCollection  isCollection
		                ifTrue: [ anItemOrItemCollection  ]
		                ifFalse: [ anItemOrItemCollection  asArray ].
]

{ #category : #'API - Audit & Alerts' }
ACTenant >> getAlerts [

	<script: 'self new getAlerts content inspect'>
	^ connection get: '/api/alerts'
]

{ #category : #'API - Audit & Alerts' }
ACTenant >> getAlertsFilters [

	<script: 'self new getAlertsFilters inspect'>
	^ connection get: '/api/alerts/alert-filters'
]

{ #category : #'API - Audit & Alerts' }
ACTenant >> getAlertsNotificationStatistics [

<script: 'self new getAlertsNotificationStatistics inspect'>
	^ connection get: '/api/alerts/alert-notification-stats'
]

{ #category : #'API - Audit & Alerts' }
ACTenant >> getAlertsStatistics [

	<script: 'self new getAlertsStatistics inspect'>
	^ connection get: '/api/alerts/alert-stats'
]

{ #category : #'API - Audit & Alerts' }
ACTenant >> getAuditLogs [

	<script: 'self new getAuditLogs content inspect'>
	^ connection get: '/user/audit/log/details/page' withQuery: { 
			  (#page -> 0).
			  (#size -> 100) }
]

{ #category : #'API - Audit & Alerts' }
ACTenant >> getAuditLogsFilter [

	<script: 'self new getAuditLogsFilter inspect'>
	^ connection get: '/user/audit/log/filters'
]

{ #category : #'API - Business Unit' }
ACTenant >> getBusinessUnits [

	<script: 'self new getBusinessUnits inspect'>
	^ connection get: '/user/business-units/'
]

{ #category : #'API - Misc' }
ACTenant >> getFeatureFlags [

<script: 'self new getFeatureFlags inspect'>
	^ connection get: '/user/feature-flag'
]

{ #category : #'API - Findings' }
ACTenant >> getFindings [

	<script: 'self new getFindings inspect'>
	^ connection
		  post: '/user/findings/'
		  withPayload: (NeoJSONObject fromString:
				   '{"page":0,"size":100,"sort":"","sortColumns":[],"filters":{},"ticketStatusRequired":true,"ignoreMitigated":null,"ignoreDuplicate":true}')
]

{ #category : #'API - Audit & Alerts' }
ACTenant >> getLogins [

	<script: 'self new getLogins content inspect'>
	^ connection get: '/user/audit/log/details/page' withQuery: { 
			  (#revisionType -> 'LOGGED_IN').
			  (#page -> 0).
			  (#size -> 10) }
]

{ #category : #'API - Product' }
ACTenant >> getProductTypes [

	<script: 'self new getProductTypes inspect'>
	^ connection get: '/user/product-type'
]

{ #category : #'API - Product' }
ACTenant >> getProducts [

	<script: 'self new getProducts inspect'>
	^ connection get: '/user/product'
]

{ #category : #'API - Product' }
ACTenant >> getProductsAll [

	<script: 'self new getProductsAll inspect'>
	^ connection get: '/user/product/all' withQuery: { 
			  (#page -> 0).
			  (#size -> 2000).
			  (#sort -> #NAME) }
]

{ #category : #'API - Product' }
ACTenant >> getProductsElastic [

	<script: 'self new getProductsElastic inspect'>
	^ connection get: '/user/product/elastic/paged' withQuery: { 
			  (#environmentName -> #STAGING).
			  (#pageSize -> 100).
			  (#pageNumber -> 0).
			  (#tags -> #'').
			  (#sortBy -> #NAME).
			  (#direction -> #ASC) }
]

{ #category : #'API - Misc' }
ACTenant >> getSessionDetails [

<script: 'self new getSessionDetails inspect'>
	^ connection get: '/user/details/session'
]

{ #category : #'API - Sub Product' }
ACTenant >> getSubProductTypes [

	<script: 'self new getSubProductTypes inspect'>
	^ connection get: '/user/sub-product-type'
]

{ #category : #'API - Sub Product' }
ACTenant >> getSubProducts [

	<script: 'self new getSubProducts inspect'>
	^ connection get: '/user/sub-product'
]

{ #category : #'API - Sub Product' }
ACTenant >> getSubProductsElastic [

	<script: 'self new getSubProductsElastic inspect'>
	^ connection get: '/user/sub-product/elastic' withQuery: { 
			  (#environmentName -> #STAGING).
			  (#pageSize -> 20).
			  (#pageNumber -> 0).
			  (#tags -> #'').
			  (#sortBy -> #NAME).
			  (#direction -> #ASC) }
]

{ #category : #'API - Users & Teams' }
ACTenant >> getTeams [

	<script: 'self new getTeams inspect'>
	^ connection get: '/api/team/all-teams'
]

{ #category : #'API - Users & Teams' }
ACTenant >> getUsers [

	<script: 'self new getUsers inspect'>
	^ connection get: '/user/data/users'
]

{ #category : #initialization }
ACTenant >> initialize [

	connection := ACConnection for: self
]

{ #category : #'API - Business Unit' }
ACTenant >> updateBusinessUnits: aBusinessUnitOrCollection [

	^ self updateItems: '/user/product' items: aBusinessUnitOrCollection 
	
]

{ #category : #accessing }
ACTenant >> updateItems: aUrl items: anItemOrItemCollection [

	| items |
	items := self ensureCollection: anItemOrItemCollection.
	^ items collect: [ :item | 
		  connection put: aUrl withPayload: item ]
]

{ #category : #'API - Product' }
ACTenant >> updateProducts: aProductOrCollection [


	^ self updateItems:  '/user/product' items: aProductOrCollection 
]

{ #category : #'API - Sub Product' }
ACTenant >> updateSubProducts: anItemOrCollection [

	^ self updateItems: '/user/sub-product' items: anItemOrCollection  
	
]

{ #category : #accessing }
ACTenant >> url [
	^ url
]

{ #category : #accessing }
ACTenant >> url: aUrl [

	url := aUrl
]
