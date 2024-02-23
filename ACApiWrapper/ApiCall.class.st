Class {
	#name : #ApiCall,
	#superclass : #Object,
	#instVars : [
		'requestHelpers',
		'responseHelpers',
		'connection',
		'token',
		'result'
	],
	#category : #ACApiWrapper
}

{ #category : #'as yet unclassified' }
ApiCall >> applyRequestHelpers [

	requestHelpers do: #apply
]

{ #category : #'as yet unclassified' }
ApiCall >> applyResponseHelpers [

	responseHelpers do: #apply
]

{ #category : #accessing }
ApiCall >> connection [

	^ connection
]

{ #category : #'actions api' }
ApiCall >> delete [
]

{ #category : #'actions api' }
ApiCall >> get [
	self applyRequestHelpers.
	result := connection get.
	self applyResponseHelpers
]

{ #category : #initialization }
ApiCall >> initialize [

	token := Smalltalk os environment at: 'acapi_token'.
	self setupConnection.
	responseHelpers := OrderedCollection new.
	requestHelpers := OrderedCollection new.
	requestHelpers
		addFirst: (UrlHelper for: self);
		add: (AuthenticationHelper for: self)
]

{ #category : #'actions api' }
ApiCall >> patch [
]

{ #category : #'actions api' }
ApiCall >> post [
]

{ #category : #'actions api' }
ApiCall >> put [
]

{ #category : #'as yet unclassified' }
ApiCall >> setupConnection [
	connection := ZnClient new
	systemPolicy;
		  logLevel: 3;
		  signalProgress: false;
		  autoResetEntityMethods: #( HEAD DELETE GET );
		  logToTranscript;
		  yourself
]

{ #category : #accessing }
ApiCall >> token [ 

	^ token
]
