Class {
	#name : #JSONHelper,
	#superclass : #ApiHelper,
	#category : #'ACApiWrapper-Helpers'
}

{ #category : #'target resize' }
JSONHelper >> apply [

	super apply.
	self trace: self className.
	apiCall connection link forJsonREST
]
