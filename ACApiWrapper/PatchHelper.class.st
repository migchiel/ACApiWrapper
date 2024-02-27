Class {
	#name : #PatchHelper,
	#superclass : #Object,
	#category : #'ACApiWrapper-Helpers'
}

{ #category : #operations }
PatchHelper class >> applyTo: anApiCall [

anApiCall connection link method: #PATCH
]
