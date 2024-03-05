Class {
	#name : #PaginatedResponseHelper,
	#superclass : #Object,
	#category : #'ACApiWrapper-Helpers'
}

{ #category : #operations }
PaginatedResponseHelper class >> applyTo: anApiCall [

	| pagedObject |
	pagedObject := ACPagedObject new.
	pagedObject properties: anApiCall payload.
	anApiCall payload: pagedObject
]
