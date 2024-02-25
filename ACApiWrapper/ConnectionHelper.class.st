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

	requestHelpers do: #apply
]

{ #category : #'as yet unclassified' }
ConnectionHelper >> applyResponseHelpers [

	responseHelpers do: #apply
]

{ #category : #'as yet unclassified' }
ConnectionHelper >> applyToRequest: aHelperCollection [

	requestHelpers addAll: (self instantiateHelpers: aHelperCollection)
]

{ #category : #'as yet unclassified' }
ConnectionHelper >> applyToResponse: aHelperCollection [

	responseHelpers addAll: (self instantiateHelpers: aHelperCollection)
]

{ #category : #initialization }
ConnectionHelper >> initialize [ 

responseHelpers := OrderedCollection new.
	requestHelpers := OrderedCollection new.


]

{ #category : #'as yet unclassified' }
ConnectionHelper >> instantiateHelpers: aHelperCollection [

	^ aHelperCollection collect: [ :helper | helper applyTo: apiClient ]
]
