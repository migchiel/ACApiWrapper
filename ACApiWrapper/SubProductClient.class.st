Class {
	#name : #SubProductClient,
	#superclass : #ApiClient,
	#category : #'ACApiWrapper-Core'
}

{ #category : #'as yet unclassified' }
SubProductClient class >> dtoClass [

	^ ACSubProduct
]

{ #category : #'as yet unclassified' }
SubProductClient >> apiPath [

	^ super apiPath, '/api/sub-product'
]
