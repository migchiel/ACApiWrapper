Class {
	#name : #AddSegmentHelper,
	#superclass : #ApiHelper,
	#category : #'ACApiWrapper-Helpers'
}

{ #category : #'target resize' }
AddSegmentHelper >> apply [

	apiCall connection link addPathSegment: apiCall payload asString
]
