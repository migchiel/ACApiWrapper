Class {
	#name : #BodyHelper,
	#superclass : #RequestHelper,
	#category : #'ACApiWrapper-Helpers'
}

{ #category : #'target resize' }
BodyHelper >> apply [

	super apply.
	apiCall connection link contents: apiCall items
]
