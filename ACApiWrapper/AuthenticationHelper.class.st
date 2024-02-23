Class {
	#name : #AuthenticationHelper,
	#superclass : #ApiHelper,
	#category : #ACApiWrapper
}

{ #category : #'target resize' }
AuthenticationHelper >> apply [

	apiCall connection setBearerAuthentication: apiCall token
]
