Class {
	#name : #FindingClient,
	#superclass : #ApiClient,
	#category : #'ACApiWrapper-Core'
}

{ #category : #'as yet unclassified' }
FindingClient class >> dtoClass [

	^ ACFindingDto
]

{ #category : #'as yet unclassified' }
FindingClient >> apiPath [ 

	^ '/user/findings/'
]

{ #category : #public }
FindingClient >> post: aCollection [

	payload := aCollection.
	requestHelpers add: (BodyHelper for: self).
	^ self post
]
