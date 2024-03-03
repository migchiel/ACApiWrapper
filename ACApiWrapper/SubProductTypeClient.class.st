Class {
	#name : #SubProductTypeClient,
	#superclass : #ApiClient,
	#category : #'ACApiWrapper-Core'
}

{ #category : #url }
SubProductTypeClient >> clientPathSegments [

	^ '/user/sub-product-type'
]

{ #category : #types }
SubProductTypeClient >> dtoClass [

	^ ACSubProductType 
]
