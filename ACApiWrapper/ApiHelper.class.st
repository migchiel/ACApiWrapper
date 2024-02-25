Class {
	#name : #ApiHelper,
	#superclass : #Object,
	#instVars : [
		'apiCall'
	],
	#category : #'ACApiWrapper-Helpers'
}

{ #category : #'as yet unclassified' }
ApiHelper class >> applyTo: anApiCall [

	^ self new apiCall: anApiCall;yourself

]

{ #category : #testing }
ApiHelper class >> isAbstract [

	^ self == ApiHelper
]

{ #category : #accessing }
ApiHelper >> apiCall: anApiCall [

	apiCall := anApiCall 
]

{ #category : #'target resize' }
ApiHelper >> apply [
]
