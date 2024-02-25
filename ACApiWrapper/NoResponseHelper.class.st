Class {
	#name : #NoResponseHelper,
	#superclass : #ApiHelper,
	#category : #'ACApiWrapper-Helpers'
}

{ #category : #'target resize' }
NoResponseHelper >> apply [


	apiCall connection link
		contentReader: nil;
		contentWriter: nil;
		accept: ZnMimeType any
]
