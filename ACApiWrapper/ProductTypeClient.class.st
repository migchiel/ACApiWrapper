Class {
	#name : #ProductTypeClient,
	#superclass : #ApiClient,
	#category : #'ACApiWrapper-Core'
}

{ #category : #'as yet unclassified' }
ProductTypeClient class >> dtoClass [

	^ ACProductType
]

{ #category : #'as yet unclassified' }
ProductTypeClient >> apiPath [

	^ super apiPath , '/user/product-type'
]

{ #category : #public }
ProductTypeClient >> create: aProductTypeCollection [

	self applyToRequest: {
			JSONHelper.
			PostHelper.
			BodyHelper }.
	^ aProductTypeCollection collect: [ :item |
		  payload := item.
		  self post ]
]

{ #category : #updating }
ProductTypeClient >> update: aProductTypeCollection [

	payload := aProductTypeCollection.
	self applyToRequest: { BodyHelper }.
	^ self put
]
