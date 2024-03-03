Class {
	#name : #ACScripts,
	#superclass : #Object,
	#category : #'ACApiWrapper-Scripts'
}

{ #category : #'as yet unclassified' }
ACScripts >> createWorkloads [

	<script: 'self new createWorkloads'>
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
	(products collect: #name).
	ACApiItemView openWith: products
]

{ #category : #'as yet unclassified' }
ACScripts >> deleteWorkloads [

<script: 'self new deleteWorkloads'>
	
ProductClient new delete: (ProductClient new read collect: #id).


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
ACScripts >> getWorkloads [

	<script: 'self new getWorkloads'>
	ACApiItemView openWith: (	ProductClient new read collect: #name )
]

{ #category : #'as yet unclassified' }
ACScripts >> updateWorkloads [

	<script: 'self new updateWorkloads'>
	| products client |
	client := ProductClient new.
	products := client read.
	(client update: (products collect: [ :p |
			  p
				  name: p name , '-updated';
				  yourself ])).
		client inspect
]
