Class {
	#name : #ACProductScripts,
	#superclass : #ACScripts,
	#category : #'ACApiWrapper-Scripts'
}

{ #category : #scripting }
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

{ #category : #scripting }
ACProductScripts >> deleteProducts [

	<script: 'self new deleteProducts'>
	ACApiItemView openWith: (tenant deleteProducts: tenant getProducts)
]

{ #category : #scripting }
ACProductScripts >> getProductTypes [

	<script: 'self new getProductTypes'>
	ACApiItemView openWith:
		(tenant getProductTypes collect: #name)
]

{ #category : #scripting }
ACProductScripts >> getProducts [

	<script: 'self new getProducts'>
	ACApiItemView openWith: (tenant getProducts collect: #name)
]

{ #category : #scripting }
ACProductScripts >> updateProducts [

	<script: 'self new updateProducts'>
	| products |
	products := tenant getProducts.
	products := products collect: [ :p | 
		            p
			            name: p name , '-updated';
			            yourself ].
	products := tenant updateProducts: products.
	ACApiItemView openWith: (products collect: #name)
]
