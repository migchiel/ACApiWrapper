Class {
	#name : #AddSegmentHelper,
	#superclass : #RequestHelper,
	#category : #ACApiWrapper
}

{ #category : #'target resize' }
AddSegmentHelper >> apply [

	super apply.
	apiCall connection link addPathSegment: apiCall items asString
]
