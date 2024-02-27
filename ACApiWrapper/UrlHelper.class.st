Class {
	#name : #UrlHelper,
	#superclass : #Object,
	#category : #'ACApiWrapper-Helpers'
}

{ #category : #operations }
UrlHelper class >> applyTo: anApiCall [

anApiCall connection link url: anApiCall fullPath
]
