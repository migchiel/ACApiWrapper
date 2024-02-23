Class {
	#name : #SubProductClient,
	#superclass : #ApiClient,
	#category : #'ACApiWrapper-Helpers'
}

{ #category : #'as yet unclassified' }
SubProductClient >> apiPath [

	^ super apiPath, '/api/sub-product'
]
