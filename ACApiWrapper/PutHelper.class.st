Class {
	#name : #PutHelper,
	#superclass : #ApiHelper,
	#category : #'ACApiWrapper-Helpers'
}

{ #category : #'target resize' }
PutHelper >> apply [

	apiCall connection link method: #PUT
]
