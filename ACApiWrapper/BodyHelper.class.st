Class {
	#name : #BodyHelper,
	#superclass : #RequestHelper,
	#category : #ACApiWrapper
}

{ #category : #'target resize' }
BodyHelper >> apply [

	super apply.
	apiCall connection link contents: apiCall items
]
