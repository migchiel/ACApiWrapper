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

	connectionHelper  applyToRequest: {
			JSONHelper.
			PostHelper.
			BodyHelper }.
	^ (self ensureCollection: aProductOrCollection) collect: [ :item |
		  payload := item properties.
		  self post ]
]

{ #category : #public }
ProductClient >> delete: aProductOrCollection [

	connectionHelper  applyToRequest: {
			AddSegmentHelper.
			DeleteHelper }.
	^ (self ensureCollection: aProductOrCollection) collect: [ :item |
		  payload := item.
		  self delete ]
]

{ #category : #public }
ProductClient >> update: aProductOrCollection [

	connectionHelper applyToRequest: {
			JSONHelper.
			PutHelper.
			BodyHelper }.
	^ (self ensureCollection: aProductOrCollection) collect: [ :item |
		  payload := item properties.
		  self put ]
]
