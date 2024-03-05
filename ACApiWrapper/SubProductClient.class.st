Class {
	#name : #SubProductClient,
	#superclass : #ApiClient,
	#category : #'ACApiWrapper-Core'
}

{ #category : #'as yet unclassified' }
SubProductClient >> clientPathSegments [ 

	^ '/api/sub-product'
]

{ #category : #'helper methods' }
SubProductClient >> createResponseHelpers [

	connectionHelper applyToResponse: { MultipleDtoFromResponseHelper }
]

{ #category : #'as yet unclassified' }
SubProductClient >> dtoClass [

	^ ACSubProduct
]

{ #category : #'helper methods' }
SubProductClient >> getResponseHelpers [

	connectionHelper applyToResponse: { MultipleDtoFromResponseHelper }
]
