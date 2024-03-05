Class {
	#name : #SubProductTypeClient,
	#superclass : #ApiClient,
	#category : #'ACApiWrapper-Core'
}

{ #category : #url }
SubProductTypeClient >> clientPathSegments [

	^ '/user/sub-product-type'
]

{ #category : #'helper methods' }
SubProductTypeClient >> createResponseHelpers [

	connectionHelper applyToResponse: { MultipleDtoFromResponseHelper }
]

{ #category : #types }
SubProductTypeClient >> dtoClass [

	^ ACSubProductType 
]

{ #category : #'helper methods' }
SubProductTypeClient >> getResponseHelpers [

	connectionHelper applyToResponse: { MultipleDtoFromResponseHelper }
]
