Class {
	#name : #JSONHelper,
	#superclass : #ApiHelper,
	#category : #ACApiWrapper
}

{ #category : #'target resize' }
JSONHelper >> apply [

	apiCall connection forJsonREST 
]
