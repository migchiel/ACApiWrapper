Class {
	#name : #ACScripts,
	#superclass : #Object,
	#category : #'ACApiWrapper-Scripts'
}

{ #category : #'as yet unclassified' }
ACScripts >> createProducts [

	<script: 'self new createProducts'>
	| productTypes products |
	productTypes := ProductTypeClient new read.
	products := ProductClient new create: {
			            (ACProduct new
				             name: 'Test-Product-1';
				             description: 'Some description';
				             type: productTypes atRandom;
				             yourself).
			            (ACProduct new
				             name: 'Test-Product-2';
				             description: 'Some description';
				             type: productTypes atRandom;
				             yourself) }.
	ACApiItemView openWith: (products collect: #name)
]

{ #category : #'as yet unclassified' }
ACScripts >> deleteProducts [

	<script: 'self new deleteProducts'>
	ProductClient new delete: (ProductClient new read collect: #id)
]

{ #category : #'as yet unclassified' }
ACScripts >> getAlerts [

	<script: 'self new getAlerts'>
	| alerts |
	alerts := AlertClient new read content collect: [ :entry |
		          String streamContents: [ :s |
			          s << entry title << ' at ' << entry createdAt] ].
	ACApiItemView openWith: alerts 
]

{ #category : #'as yet unclassified' }
ACScripts >> getLogins [

	<script: 'self new getLogins'>
	| logins |
	logins := AuditLogClient new read content collect: [ :entry |
		 String streamContents: [ :s |
			 s << entry message << ' at ' << entry createdAt << ' from '
			 << entry clientIp ] ].
	ACApiItemView openWith: logins.
]

{ #category : #'as yet unclassified' }
ACScripts >> getProductTypes [

	<script: 'self new getProductTypes'>
	ACApiItemView openWith: (ProductTypeClient new read collect: #name)
]

{ #category : #'as yet unclassified' }
ACScripts >> getProducts [

	<script: 'self new getProducts'>
	ACApiItemView openWith: (ProductClient new read collect: #name)
]

{ #category : #'as yet unclassified' }
ACScripts >> getSessionDetails [

	<script: 'self new getSessionDetails'>
	| sessionDetails |
	sessionDetails := SessionClient new read.
	ACApiItemView openWith: {
			'Organisation   : ', sessionDetails currentOrgSessionDto name.
			'Organisation ID: ', sessionDetails currentOrgSessionDto id asString }
]

{ #category : #'as yet unclassified' }
ACScripts >> getSubProductTypes [

	<script: 'self new getSubProductTypes'>
	ACApiItemView openWith: (SubProductTypeClient new read collect: #name)
]

{ #category : #'as yet unclassified' }
ACScripts >> getSubProducts [

	<script: 'self new getSubProducts'>
	ACApiItemView openWith: (SubProductClient new read collect: #name)
]

{ #category : #'as yet unclassified' }
ACScripts >> getUsers [

	<script: 'self new getUsers'>
	ACApiItemView openWith: (UserClient new read collect: #name)
]

{ #category : #'as yet unclassified' }
ACScripts >> updateProducts [

	<script: 'self new updateProducts'>
	| products client |
	client := ProductClient new.
	products := client read.
	products := client update: (products collect: [ :p |
			             p
				             name: p name , '-updated';
				             yourself ]).
	ACApiItemView openWith: (products collect: #name)
]
