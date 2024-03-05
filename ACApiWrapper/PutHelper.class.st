Class {
	#name : #PutHelper,
	#superclass : #Object,
	#category : #'ACApiWrapper-Helpers'
}

{ #category : #operations }
PutHelper class >> applyTo: anApiCall [

	anApiCall connection connection method: #PUT
]
