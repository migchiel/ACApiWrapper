Class {
	#name : #ProductClient,
	#superclass : #ApiClient,
	#category : #'ACApiWrapper-Core'
}

{ #category : #'as yet unclassified' }
ProductClient >> clientPathSegments [

	^ '/user/product'
]

{ #category : #'as yet unclassified' }
ProductClient >> dtoClass [

	^ ACProduct
]
