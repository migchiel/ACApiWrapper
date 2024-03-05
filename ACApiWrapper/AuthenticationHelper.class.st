Class {
	#name : #AuthenticationHelper,
	#superclass : #Object,
	#category : #'ACApiWrapper-Helpers'
}

{ #category : #operations }
AuthenticationHelper class >> applyTo: anApiCall [

	anApiCall connection connection setBearerAuthentication: anApiCall token
]
