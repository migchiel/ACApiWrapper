Class {
	#name : #PutHelper,
	#superclass : #RequestHelper,
	#category : #ACApiWrapper
}

{ #category : #'target resize' }
PutHelper >> apply [

	super apply.
	apiCall connection link method: #PUT
]
