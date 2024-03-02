Class {
	#name : #Scripts,
	#superclass : #Object,
	#category : #'ACApiWrapper-Scripts'
}

{ #category : #'as yet unclassified' }
Scripts >> createWorkloads [

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
	(products collect: #name) inspect
]

{ #category : #'as yet unclassified' }
Scripts >> deleteWorkloads [

<script: 'self new deleteWorkloads'>
	
ProductClient new delete: (ProductClient new read collect: #id).


]

{ #category : #'as yet unclassified' }
Scripts >> getLogins [

	<script: 'self new getLogins'>
	(AuditLogClient new read collect: [ :entry |
		String streamContents: [ :s |  
		 s << entry message << ' at ' << entry createdAt << ' from '
		 << entry clientIp ]]) inspect
]

{ #category : #'as yet unclassified' }
Scripts >> getWorkloads [

	<script: 'self new getWorkloads'>
	(ProductClient new read collect: #name) inspect
]

{ #category : #'as yet unclassified' }
Scripts >> updateWorkloads [

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
