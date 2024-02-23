Class {
	#name : #JSONHelper,
	#superclass : #ApiHelper,
	#category : #ACApiWrapper
}

{ #category : #'target resize' }
JSONHelper >> apply [

	super apply.
	apiCall connection link forJsonREST
]
