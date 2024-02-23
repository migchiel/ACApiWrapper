Class {
	#name : #PutHelper,
	#superclass : #RequestHelper,
	#category : #'ACApiWrapper-Helpers'
}

{ #category : #'target resize' }
PutHelper >> apply [

	super apply.
	apiCall connection link method: #PUT
]
