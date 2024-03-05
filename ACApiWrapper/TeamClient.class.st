Class {
	#name : #TeamClient,
	#superclass : #ApiClient,
	#category : #'ACApiWrapper-Core'
}

{ #category : #url }
TeamClient >> clientPathSegments [

	^ '/api/team/all-teams'
]

{ #category : #'helper methods' }
TeamClient >> createResponseHelpers [

	connectionHelper applyToResponse: { MultipleDtoFromResponseHelper }
]

{ #category : #types }
TeamClient >> dtoClass [

	^ ACTeam
]

{ #category : #'helper methods' }
TeamClient >> getResponseHelpers [

	connectionHelper applyToResponse: { MultipleDtoFromResponseHelper }
]
