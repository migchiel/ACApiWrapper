Class {
	#name : #PostHelper,
	#superclass : #RequestHelper,
	#category : #ACApiWrapper
}

{ #category : #'target resize' }
PostHelper >> apply [

	super apply.
	apiCall connection link method: #POST
]
