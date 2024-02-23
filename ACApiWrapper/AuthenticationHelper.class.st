Class {
	#name : #AuthenticationHelper,
	#superclass : #ApiHelper,
	#category : #'ACApiWrapper-Helpers'
}

{ #category : #'target resize' }
AuthenticationHelper >> apply [

	super apply.
	apiCall connection link setBearerAuthentication: apiCall token
]
