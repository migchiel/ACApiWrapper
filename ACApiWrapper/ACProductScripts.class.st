Class {
	#name : #ACProductScripts,
	#superclass : #ACScripts,
	#category : #'ACApiWrapper-Scripts'
}

{ #category : #'as yet unclassified' }
ACProductScripts >> createProducts [

	<script: 'self new createProducts'>
	| productTypes products |
	productTypes := tenant getProductTypes.
	products := tenant createProducts: { 
			            (NeoJSONObject new
				             name: 'Test-Product-1';
				             description: 'Some description';
				             type: productTypes atRandom).
			            (NeoJSONObject new
				             name: 'Test-Product-2';
				             description: 'Some description';
				             type: productTypes atRandom) }.
	ACApiItemView openWith: (products collect: #name)
]

{ #category : #'as yet unclassified' }
ACProductScripts >> deleteProducts [

	<script: 'self new deleteProducts'>
	ProductClient new delete: (ProductClient new read collect: #id)
]

{ #category : #'as yet unclassified' }
ACProductScripts >> getProductTypes [

	<script: 'self new getProductTypes'>
	ACApiItemView openWith:
		(tenant getProductTypes collect: #name)
]

{ #category : #'as yet unclassified' }
ACProductScripts >> getProducts [

	<script: 'self new getProducts'>
	ACApiItemView openWith: (tenant getProducts content collect: #name)
]

{ #category : #'as yet unclassified' }
ACProductScripts >> updateProducts [

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
