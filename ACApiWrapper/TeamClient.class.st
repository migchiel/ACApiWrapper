Class {
	#name : #TeamClient,
	#superclass : #ApiClient,
	#category : #'ACApiWrapper-Core'
}

{ #category : #url }
TeamClient >> clientPathSegments [

	^ '/api/team/all-teams'
]

{ #category : #types }
TeamClient >> dtoClass [

	^ ACTeam
]
