Class {
	#name : #SubProductClient,
	#superclass : #ApiClient,
	#category : #'ACApiWrapper-Core'
}

{ #category : #'as yet unclassified' }
SubProductClient >> clientPathSegments [ 

	^ '/api/sub-product'
]

{ #category : #'as yet unclassified' }
SubProductClient >> dtoClass [

	^ ACSubProduct
]
