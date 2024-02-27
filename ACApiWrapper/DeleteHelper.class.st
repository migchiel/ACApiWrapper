Class {
	#name : #DeleteHelper,
	#superclass : #Object,
	#category : #'ACApiWrapper-Helpers'
}

{ #category : #operations }
DeleteHelper class >> applyTo: anApiCall [

anApiCall connection link method: #DELETE
]
