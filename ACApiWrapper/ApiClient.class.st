Class {
	#name : #ApiClient,
	#superclass : #Object,
	#instVars : [
		'requestHelpers',
		'responseHelpers',
		'connection',
		'token',
		'result',
		'payload'
	],
	#category : #'ACApiWrapper-Core'
}

{ #category : #'as yet unclassified' }
ApiClient class >> dtoClass [ 

	^ self subclassResponsibility 
]

{ #category : #'as yet unclassified' }
ApiClient >> apiPath [ 

	^ 'https://app.armorcode.com'
]

{ #category : #'as yet unclassified' }
ApiClient >> applyRequestHelpers [

	requestHelpers do: #apply
]

{ #category : #'as yet unclassified' }
ApiClient >> applyResponseHelpers [

	responseHelpers do: #apply
]

{ #category : #'as yet unclassified' }
ApiClient >> applyToRequest: aHelperCollection [

	requestHelpers addAll: (self instantiateHelpers: aHelperCollection)
]

{ #category : #'as yet unclassified' }
ApiClient >> applyToResponse: aHelperCollection [

	responseHelpers addAll: (self instantiateHelpers: aHelperCollection)
]

{ #category : #accessing }
ApiClient >> connection [

	^ connection
]

{ #category : #'actions api' }
ApiClient >> delete [

	self applyRequestHelpers.
	result := connection executeRequest.
	^ result
]

{ #category : #'actions api' }
ApiClient >> get [ 

self applyToRequest: {
			JSONHelper.
			GetHelper }.
	self applyToResponse: { DtoFromResponseHelper }.
	self applyRequestHelpers.
	result := connection executeRequest.
	self applyResponseHelpers.
	^ result
]

{ #category : #initialization }
ApiClient >> initialize [

	token := Smalltalk os environment at: 'acapi_token'.
	connection := SAASConnection for: self.
	responseHelpers := OrderedCollection new.
	requestHelpers := OrderedCollection new.
	requestHelpers
		addFirst: (UrlHelper applyTo: self);
		add: (AuthenticationHelper applyTo: self)
]

{ #category : #'as yet unclassified' }
ApiClient >> instantiateHelpers: aHelperCollection [

	^ aHelperCollection collect: [ :helper |
		                  helper applyTo: self ]
]

{ #category : #'actions api' }
ApiClient >> patch [

	requestHelpers
		addFirst: (JSONHelper applyTo: self);
		add: (PatchHelper applyTo: self).
	self applyRequestHelpers.
	result := connection executeRequest.
	^ result
]

{ #category : #accessing }
ApiClient >> payload [

	^ payload
]

{ #category : #accessing }
ApiClient >> payload: aPayload [

	payload := aPayload 
]

{ #category : #'actions api' }
ApiClient >> post [


	self applyRequestHelpers.
	^ connection executeRequest
]

{ #category : #'actions api' }
ApiClient >> put [

	requestHelpers
		addFirst: (JSONHelper applyTo: self);
		add: (PutHelper applyTo: self).
	self applyRequestHelpers.
	result := connection executeRequest.
	^ result
]

{ #category : #'actions api' }
ApiClient >> read [

	^ self get
]

{ #category : #accessing }
ApiClient >> result [

	^ result
]

{ #category : #accessing }
ApiClient >> result: anObject [

	result := anObject
]

{ #category : #accessing }
ApiClient >> token [ 

	^ token
]
