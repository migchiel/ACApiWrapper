Class {
	#name : #UserClient,
	#superclass : #ApiClient,
	#category : #'ACApiWrapper-Core'
}

{ #category : #url }
UserClient >> clientPathSegments [

	^ '/user/data/users'
]

{ #category : #types }
UserClient >> dtoClass [

	^ ACUser
]

{ #category : #'helper methods' }
UserClient >> getRequestHelpers [

	connectionHelper applyToResponse: { MultipleDtoFromResponseHelper }
]
