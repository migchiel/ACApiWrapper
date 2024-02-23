Class {
	#name : #UserClient,
	#superclass : #ApiClient,
	#category : #'ACApiWrapper-Core'
}

{ #category : #'as yet unclassified' }
UserClient >> apiPath [

	^ super apiPath, '/user/data/users'
]
