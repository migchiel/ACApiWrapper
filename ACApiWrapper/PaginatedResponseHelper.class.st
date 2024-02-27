Class {
	#name : #PaginatedResponseHelper,
	#superclass : #Object,
	#category : #'ACApiWrapper-Helpers'
}

{ #category : #operations }
PaginatedResponseHelper class >> applyTo: anApiCall [

anApiCall result: anApiCall result content
]
