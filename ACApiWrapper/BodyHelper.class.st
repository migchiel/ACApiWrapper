Class {
	#name : #BodyHelper,
	#superclass : #Object,
	#category : #'ACApiWrapper-Helpers'
}

{ #category : #operations }
BodyHelper class >> applyTo: anApiCall [

	anApiCall connection connection contents: anApiCall payload
]
