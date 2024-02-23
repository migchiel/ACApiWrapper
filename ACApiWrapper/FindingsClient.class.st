Class {
	#name : #FindingsClient,
	#superclass : #ApiClient,
	#category : #'ACApiWrapper-Core'
}

{ #category : #'as yet unclassified' }
FindingsClient >> apiPath [ 

	^ '/user/findings/'
]

{ #category : #public }
FindingsClient >> post: aCollection [

	payload := aCollection.
	requestHelpers add: (BodyHelper for: self).
	^ self post
]
