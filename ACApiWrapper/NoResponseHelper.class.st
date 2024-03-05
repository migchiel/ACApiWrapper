Class {
	#name : #NoResponseHelper,
	#superclass : #Object,
	#category : #'ACApiWrapper-Helpers'
}

{ #category : #operations }
NoResponseHelper class >> applyTo: anApiCall [

	anApiCall connection connection
		contentReader: nil;
		contentWriter: nil;
		accept: ZnMimeType any
]
