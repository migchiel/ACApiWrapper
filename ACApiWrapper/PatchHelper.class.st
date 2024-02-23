Class {
	#name : #PatchHelper,
	#superclass : #RequestHelper,
	#category : #'ACApiWrapper-Helpers'
}

{ #category : #'target resize' }
PatchHelper >> apply [

	super apply.
	apiCall connection link method: #PATCH
]
