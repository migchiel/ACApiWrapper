Class {
	#name : #ProductTypeClient,
	#superclass : #ApiClient,
	#category : #'ACApiWrapper-Core'
}

{ #category : #'as yet unclassified' }
ProductTypeClient >> clientPathSegments [ 

	^  '/user/product-type'
]

{ #category : #'as yet unclassified' }
ProductTypeClient >> dtoClass [

	^ ACProductType
]
