Class {
	#name : #ApiClient,
	#superclass : #Object,
	#instVars : [
		'connection',
		'token',
		'result',
		'payload',
		'connectionHelper'
	],
	#category : #'ACApiWrapper-Core'
}

{ #category : #'as yet unclassified' }
ApiClient >> clientPathSegments [

	^ self subclassResponsibility 
]

{ #category : #accessing }
ApiClient >> connection [

	^ connection
]

{ #category : #public }
ApiClient >> create: anItemOrCollection [

	self createRequestHelpers.
	self createResponseHelpers.
	result := (self ensureCollection: anItemOrCollection) collect: [
		          :item |
		          payload := item properties.
		          self post ].
	connectionHelper applyResponseHelpers.
	^ result
]

{ #category : #'as yet unclassified' }
ApiClient >> createRequestHelpers [

connectionHelper
		applyToRequest: {
				JSONHelper.
				PostHelper.
				BodyHelper };
		applyToResponse: { DtoFromResponseHelper }.

]

{ #category : #'as yet unclassified' }
ApiClient >> createResponseHelpers [

	connectionHelper
		applyToResponse: { DtoFromResponseHelper }
]

{ #category : #'actions api' }
ApiClient >> delete [

	connectionHelper  applyRequestHelpers.
	result := connection executeRequest.
	^ result
]

{ #category : #public }
ApiClient >> delete: anItemOrCollection [

	self deleteRequestHelpers.
	self deleteResponseHelpers.
	result := (self ensureCollection: anItemOrCollection) collect: [
		          :item |
		          payload := item.
		          self delete ].
	connectionHelper applyResponseHelpers.
	^ result
]

{ #category : #'as yet unclassified' }
ApiClient >> deleteRequestHelpers [

connectionHelper applyToRequest: {
			AddSegmentHelper.
			DeleteHelper }.
]

{ #category : #'as yet unclassified' }
ApiClient >> deleteResponseHelpers [

	
]

{ #category : #'as yet unclassified' }
ApiClient >> dtoClass [ 

	^ self subclassResponsibility 
]

{ #category : #'as yet unclassified' }
ApiClient >> ensureCollection: aProductOrCollection [

	^ aProductOrCollection isCollection
		ifTrue: [ aProductOrCollection ]
		ifFalse: [ Array with: aProductOrCollection ].

]

{ #category : #'as yet unclassified' }
ApiClient >> fullPath [

	^ self saasBasePath , self clientPathSegments
]

{ #category : #'actions api' }
ApiClient >> get [

	connectionHelper applyRequestHelpers.
	result := connection executeRequest.
	connectionHelper applyResponseHelpers.
	^ result
]

{ #category : #'as yet unclassified' }
ApiClient >> getRequestHelpers [

	connectionHelper applyToRequest: {
			JSONHelper.
			GetHelper }
]

{ #category : #'as yet unclassified' }
ApiClient >> getResponseHelpers [

	connectionHelper applyToResponse: { DtoFromResponseHelper }
]

{ #category : #initialization }
ApiClient >> initialize [

	token := Smalltalk os environment at: 'acapi_token'.
	connection := SAASConnection for: self.
	connectionHelper := ConnectionHelper for: self.
	connectionHelper applyToRequest: {
			UrlHelper.
			AuthenticationHelper }
]

{ #category : #'actions api' }
ApiClient >> patch [

	connectionHelper applyToRequest: {
			JSONHelper.
			PatchHelper };
	 applyRequestHelpers.
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

	connectionHelper applyRequestHelpers.
	^ connection executeRequest.

]

{ #category : #'actions api' }
ApiClient >> put [

	connectionHelper applyToRequest: {
			JSONHelper.
			PutHelper };
	 applyRequestHelpers.
	result := connection executeRequest.
	^ result
]

{ #category : #'actions api' }
ApiClient >> read [


self getRequestHelpers.
	self getResponseHelpers.
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

{ #category : #'as yet unclassified' }
ApiClient >> saasBasePath [

	^ 'https://app.armorcode.com'
]

{ #category : #accessing }
ApiClient >> token [ 

	^ token
]

{ #category : #public }
ApiClient >> update: anItemOrCollection [

	self updateRequestHelpers.
	self updateResponseHelpers.
	result := (self ensureCollection: anItemOrCollection) collect: [ :item |
		  payload := item properties.
		  self put ].
	connectionHelper applyResponseHelpers.
	^ result
	
]

{ #category : #'as yet unclassified' }
ApiClient >> updateRequestHelpers [

	connectionHelper applyToRequest: {
			JSONHelper.
			PutHelper.
			BodyHelper }.
]

{ #category : #'as yet unclassified' }
ApiClient >> updateResponseHelpers [

	
]
