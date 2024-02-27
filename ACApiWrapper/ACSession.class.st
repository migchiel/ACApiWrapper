Class {
	#name : #ACSession,
	#superclass : #ACObject,
	#category : #'ACApiWrapper-Dto'
}

{ #category : #'as yet unclassified' }
ACSession >> organisationName [

	^ self currentOrgSessionDto name
]
