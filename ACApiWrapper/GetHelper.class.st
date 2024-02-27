Class {
	#name : #GetHelper,
	#superclass : #Object,
	#category : #'ACApiWrapper-Helpers'
}

{ #category : #operations }
GetHelper class >> applyTo: anApiCall [

anApiCall connection link method: #GET
]
