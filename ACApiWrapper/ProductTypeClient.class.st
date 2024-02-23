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

	^ aProductTypeCollection collect: [ :item |
		  payload := item.
		  requestHelpers add: (BodyHelper for: self).
		  self post ]
]

{ #category : #updating }
ProductTypeClient >> update: aProductTypeCollection [

	payload := aProductTypeCollection.
	requestHelpers add: (BodyHelper for: self).
	^ self put
]
