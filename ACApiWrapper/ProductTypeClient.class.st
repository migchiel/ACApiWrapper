Class {
	#name : #ProductTypeClient,
	#superclass : #ApiClient,
	#category : #'ACApiWrapper-Core'
}

{ #category : #'as yet unclassified' }
ProductTypeClient >> clientPathSegments [ 

	^  '/user/product-type'
]

{ #category : #public }
ProductTypeClient >> create: aProductTypeCollection [

	connectionHelper  applyToRequest: {
			JSONHelper.
			PostHelper.
			BodyHelper }.
	^ aProductTypeCollection collect: [ :item |
		  payload := item.
		  self post ]
]

{ #category : #'as yet unclassified' }
ProductTypeClient >> dtoClass [

	^ ACProductType
]

{ #category : #updating }
ProductTypeClient >> update: aProductTypeCollection [

	payload := aProductTypeCollection.
	connectionHelper  applyToRequest: { BodyHelper }.
	^ self put
]
