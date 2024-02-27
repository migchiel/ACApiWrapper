Class {
	#name : #JSONHelper,
	#superclass : #Object,
	#category : #'ACApiWrapper-Helpers'
}

{ #category : #operations }
JSONHelper class >> applyTo: anApiCall [

anApiCall connection link forJsonREST
]
