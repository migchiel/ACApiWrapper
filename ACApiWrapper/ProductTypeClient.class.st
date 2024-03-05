Class {
	#name : #ProductTypeClient,
	#superclass : #ApiClient,
	#category : #'ACApiWrapper-Core'
}

{ #category : #'as yet unclassified' }
ProductTypeClient >> clientPathSegments [ 

	^  '/user/product-type'
]

{ #category : #'helper methods' }
ProductTypeClient >> createResponseHelpers [

	connectionHelper applyToResponse: { MultipleDtoFromResponseHelper }
]

{ #category : #'as yet unclassified' }
ProductTypeClient >> dtoClass [

	^ ACProductType
]

{ #category : #'helper methods' }
ProductTypeClient >> getResponseHelpers [

	connectionHelper applyToResponse: { MultipleDtoFromResponseHelper }
]
