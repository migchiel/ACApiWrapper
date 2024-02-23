Class {
	#name : #DeleteHelper,
	#superclass : #RequestHelper,
	#category : #ACApiWrapper
}

{ #category : #'target resize' }
DeleteHelper >> apply [

	super apply.
	apiCall connection link method: #DELETE
]
