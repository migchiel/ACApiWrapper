Class {
	#name : #NoResponseHelper,
	#superclass : #ResponseHelper,
	#category : #'ACApiWrapper-Helpers'
}

{ #category : #'target resize' }
NoResponseHelper >> apply [

	super apply.
	apiCall connection link
		contentReader: nil;
		contentWriter: nil;
		accept: ZnMimeType any
]