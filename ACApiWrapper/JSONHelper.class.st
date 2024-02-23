Class {
	#name : #JSONHelper,
	#superclass : #ApiHelper,
	#category : #'ACApiWrapper-Helpers'
}

{ #category : #'target resize' }
JSONHelper >> apply [

	super apply.
	apiCall connection link forJsonREST
]
