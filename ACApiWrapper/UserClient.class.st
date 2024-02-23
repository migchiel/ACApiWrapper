Class {
	#name : #UserClient,
	#superclass : #ApiClient,
	#category : #'ACApiWrapper-Helpers'
}

{ #category : #'as yet unclassified' }
UserClient >> apiPath [

	^ super apiPath, '/user/data/users'
]
