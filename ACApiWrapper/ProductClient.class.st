Class {
	#name : #ProductClient,
	#superclass : #ApiClient,
	#category : #'ACApiWrapper-Core'
}

{ #category : #'as yet unclassified' }
ProductClient >> clientPathSegments [

	^ '/user/product'
]

{ #category : #'helper methods' }
ProductClient >> createResponseHelpers [

	connectionHelper applyToResponse: { MultipleDtoFromResponseHelper }
]

{ #category : #'as yet unclassified' }
ProductClient >> dtoClass [

	^ ACProduct
]

{ #category : #'helper methods' }
ProductClient >> getResponseHelpers [

	connectionHelper applyToResponse: { MultipleDtoFromResponseHelper }
]
