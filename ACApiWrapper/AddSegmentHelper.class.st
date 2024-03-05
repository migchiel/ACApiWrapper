Class {
	#name : #AddSegmentHelper,
	#superclass : #Object,
	#category : #'ACApiWrapper-Helpers'
}

{ #category : #'target resize' }
AddSegmentHelper class >> applyTo: anApiCall [

	anApiCall connection connection addPathSegment: anApiCall payload asString
]
