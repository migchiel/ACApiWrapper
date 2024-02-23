Class {
	#name : #PostHelper,
	#superclass : #RequestHelper,
	#category : #'ACApiWrapper-Helpers'
}

{ #category : #'target resize' }
PostHelper >> apply [

	super apply.
	apiCall connection link method: #POST
]
