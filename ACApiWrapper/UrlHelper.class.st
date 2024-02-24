Class {
	#name : #UrlHelper,
	#superclass : #ApiHelper,
	#category : #'ACApiWrapper-Helpers'
}

{ #category : #private }
UrlHelper >> apply [

	super apply.
	self trace: self className.
	apiCall connection link url: apiCall apiPath
]
