Class {
	#name : #ApiClient,
	#superclass : #Object,
	#instVars : [
		'requestHelpers',
		'responseHelpers',
		'connection',
		'token',
		'result',
		'items'
	],
	#category : #'ACApiWrapper-Core'
}

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

{ #category : #accessing }
ApiClient >> connection [

	^ connection
]

{ #category : #'actions api' }
ApiClient >> delete [

	requestHelpers add: (DeleteHelper for: self).
	self applyRequestHelpers.
	result := connection executeRequest.
	^ result
]

{ #category : #'actions api' }
ApiClient >> get [

	requestHelpers
		add: (JSONHelper for: self);
		add: (GetHelper for: self).
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
		addFirst: (UrlHelper for: self);
		add: (AuthenticationHelper for: self)
]

{ #category : #accessing }
ApiClient >> items [

	^ items
]

{ #category : #'actions api' }
ApiClient >> patch [

requestHelpers
		addFirst: (JSONHelper for: self);
		add: (PatchHelper for: self).
	self applyRequestHelpers.
	result := connection executeRequest.
	^ result
	
]

{ #category : #'actions api' }
ApiClient >> post [

	requestHelpers 
	addFirst: (JSONHelper for: self);
	add: (PostHelper for: self).
	self applyRequestHelpers.
	result := connection executeRequest.
	^ result
]

{ #category : #'actions api' }
ApiClient >> put [

	requestHelpers
		addFirst: (JSONHelper for: self);
		add: (PutHelper for: self).
	self applyRequestHelpers.
	result := connection executeRequest.
	^ result
]

{ #category : #accessing }
ApiClient >> token [ 

	^ token
]
