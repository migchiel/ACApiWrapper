Class {
	#name : #UrlHelper,
	#superclass : #RequestHelper,
	#category : #ACApiWrapper
}

{ #category : #private }
UrlHelper >> apply [

	super apply.
	apiCall connection url: apiCall apiPath
]
