Class {
	#name : #GetHelper,
	#superclass : #RequestHelper,
	#category : #'ACApiWrapper-Helpers'
}

{ #category : #'target resize' }
GetHelper >> apply [

	super apply.
	apiCall connection link method: #GET
]
