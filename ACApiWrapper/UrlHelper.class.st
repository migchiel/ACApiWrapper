Class {
	#name : #UrlHelper,
	#superclass : #ApiHelper,
	#category : #'ACApiWrapper-Helpers'
}

{ #category : #private }
UrlHelper >> apply [


	apiCall connection link url: apiCall fullPath
]
