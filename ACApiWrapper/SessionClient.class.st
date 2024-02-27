Class {
	#name : #SessionClient,
	#superclass : #ApiClient,
	#category : #'ACApiWrapper-Core'
}

{ #category : #url }
SessionClient >> clientPathSegments [

	^ '/user/details/session'
]

{ #category : #types }
SessionClient >> dtoClass [ 

	^ ACSession
]

{ #category : #'helper methods' }
SessionClient >> getResponseHelpers [ 

	connectionHelper applyToResponse: { SingleDtoFromResponseHelper }
]
