Class {
	#name : #ApiHelper,
	#superclass : #Object,
	#instVars : [
		'apiCall'
	],
	#category : #ACApiWrapper
}

{ #category : #'as yet unclassified' }
ApiHelper class >> for: anApiCall [
	| instance |
	
	instance := self new.
	instance apiCall: anApiCall.
	^ instance
]

{ #category : #accessing }
ApiHelper >> apiCall: anApiCall [

	apiCall := anApiCall 
]

{ #category : #'target resize' }
ApiHelper >> apply [

	^ self crTrace: 'Helper: ' , self className
]
