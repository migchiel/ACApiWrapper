Class {
	#name : #UrlHelper,
	#superclass : #RequestHelper,
	#category : #'ACApiWrapper-Helpers'
}

{ #category : #private }
UrlHelper >> apply [

	super apply.
	apiCall connection link url: apiCall apiPath
]
