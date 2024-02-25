Class {
	#name : #ProductClient,
	#superclass : #ApiClient,
	#category : #'ACApiWrapper-Core'
}

{ #category : #'as yet unclassified' }
ProductClient >> clientPathSegments [

	^ '/user/product'
]

{ #category : #public }
ProductClient >> create: aProductOrCollection [

	connectionHelper
		applyToRequest: {
				JSONHelper.
				PostHelper.
				BodyHelper };
		applyToResponse: { DtoFromResponseHelper }.
	result := (self ensureCollection: aProductOrCollection) collect: [ :item |
		  payload := item properties.
		  self post ].
	connectionHelper applyResponseHelpers.
	^ result
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

{ #category : #'as yet unclassified' }
ProductClient >> dtoClass [

	^ ACProduct
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
