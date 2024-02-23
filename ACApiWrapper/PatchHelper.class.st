Class {
	#name : #PatchHelper,
	#superclass : #RequestHelper,
	#category : #ACApiWrapper
}

{ #category : #'target resize' }
PatchHelper >> apply [

	super apply.
	apiCall connection link method: #PATCH
]
