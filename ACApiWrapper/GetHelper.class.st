Class {
	#name : #GetHelper,
	#superclass : #RequestHelper,
	#category : #ACApiWrapper
}

{ #category : #'target resize' }
GetHelper >> apply [

	super apply.
	apiCall connection link method: #GET
]
