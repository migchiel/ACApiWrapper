Class {
	#name : #ProductClient,
	#superclass : #ApiClient,
	#category : #'ACApiWrapper-Core'
}

{ #category : #'as yet unclassified' }
ProductClient class >> dtoClass [

	^ ACProduct
]

{ #category : #'as yet unclassified' }
ProductClient >> apiPath [

	^ super apiPath, '/user/product'
]

{ #category : #public }
ProductClient >> create: aProductOrCollection [

	self applyToRequest: { JSONHelper . PostHelper . BodyHelper }.
	^ (self ensureCollection: aProductOrCollection) collect: [ :item |
		  payload := item properties.
		  self post ]
]

{ #category : #public }
ProductClient >> delete: aProductOrCollection [


	self applyToRequest: { AddSegmentHelper . DeleteHelper }.
	^ (self ensureCollection: aProductOrCollection) collect: [ :item |
		  payload := item.
		  self delete ]
]

{ #category : #public }
ProductClient >> update: aProductOrCollection [

	
	self applyToRequest: { JSONHelper . PutHelper . BodyHelper  }.
	^ (self ensureCollection: aProductOrCollection) collect: [ :item |
		  payload := item properties.
		  self put ]
]
