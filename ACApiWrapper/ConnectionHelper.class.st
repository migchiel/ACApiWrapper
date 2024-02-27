Class {
	#name : #ConnectionHelper,
	#superclass : #Object,
	#instVars : [
		'requestHelpers',
		'responseHelpers',
		'apiClient'
	],
	#category : #'ACApiWrapper-Helpers'
}

{ #category : #'instance creation' }
ConnectionHelper class >> for: anApiClient [

	^ self new apiClient: anApiClient 
]

{ #category : #accessing }
ConnectionHelper >> apiClient [

	^ apiClient
]

{ #category : #accessing }
ConnectionHelper >> apiClient: anObject [

	apiClient := anObject
]

{ #category : #'as yet unclassified' }
ConnectionHelper >> applyRequestHelpers [

	requestHelpers do: [ :helper | helper applyTo: apiClient ]
]

{ #category : #'as yet unclassified' }
ConnectionHelper >> applyResponseHelpers [

	responseHelpers do: [ :helper | helper applyTo: apiClient ]
]

{ #category : #'as yet unclassified' }
ConnectionHelper >> applyToRequest: aHelperCollection [

	requestHelpers addAll: aHelperCollection
]

{ #category : #'as yet unclassified' }
ConnectionHelper >> applyToResponse: aHelperCollection [

	responseHelpers addAll: aHelperCollection
]

{ #category : #initialization }
ConnectionHelper >> initialize [ 

responseHelpers := OrderedCollection new.
	requestHelpers := OrderedCollection new.


]
