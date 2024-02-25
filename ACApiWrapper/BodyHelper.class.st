Class {
	#name : #BodyHelper,
	#superclass : #ApiHelper,
	#category : #'ACApiWrapper-Helpers'
}

{ #category : #'target resize' }
BodyHelper >> apply [

	apiCall connection link contents: apiCall payload
]
