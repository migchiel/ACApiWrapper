Class {
	#name : #PaginatedContentHelper,
	#superclass : #Object,
	#category : #'ACApiWrapper-Helpers'
}

{ #category : #operations }
PaginatedContentHelper class >> applyTo: anApiCall [

	| pagedObject |
	pagedObject := anApiCall payload.
	anApiCall payload: pagedObject properties content.
	MultipleDtoFromResponseHelper applyTo: anApiCall.
	pagedObject properties content: anApiCall payload.
	anApiCall payload: pagedObject
]
