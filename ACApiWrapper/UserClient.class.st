Class {
	#name : #UserClient,
	#superclass : #ApiClient,
	#category : #'ACApiWrapper-Core'
}

{ #category : #'as yet unclassified' }
UserClient >> clientPathSegments [ 

	^  '/user/data/users'
]

{ #category : #'as yet unclassified' }
UserClient >> dtoClass [

	^ ACUser
]
