Class {
	#name : #AuthenticationHelper,
	#superclass : #ApiHelper,
	#category : #'ACApiWrapper-Helpers'
}

{ #category : #'target resize' }
AuthenticationHelper >> apply [
	super apply.
	self trace: self className.
	apiCall connection link setBearerAuthentication: apiCall token
]
