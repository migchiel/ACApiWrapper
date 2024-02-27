Class {
	#name : #ApiClient,
	#superclass : #Object,
	#instVars : [
		'connection',
		'token',
		'payload',
		'connectionHelper'
	],
	#category : #'ACApiWrapper-Core'
}

{ #category : #url }
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
	^ self performCreateOrUpdate: anItemOrCollection
]

{ #category : #'helper methods' }
ApiClient >> createRequestHelpers [

	connectionHelper
		applyToRequest: {
				JSONHelper.
				PostHelper.
				BodyHelper }
]

{ #category : #'helper methods' }
ApiClient >> createResponseHelpers [

	connectionHelper
		applyToResponse: { DtoFromResponseHelper }
]

{ #category : #'actions api' }
ApiClient >> delete [

	connectionHelper applyRequestHelpers.
	payload := connection executeRequest.
	^ payload
]

{ #category : #public }
ApiClient >> delete: anItemOrCollection [

	self deleteRequestHelpers.
	self deleteResponseHelpers.
	payload := (self ensureCollection: anItemOrCollection) collect: [
		          :item |
		          payload := item.
		          self delete ].
	connectionHelper applyResponseHelpers.
	^ payload
]

{ #category : #'helper methods' }
ApiClient >> deleteRequestHelpers [

connectionHelper applyToRequest: {
			AddSegmentHelper.
			DeleteHelper }.
]

{ #category : #'helper methods' }
ApiClient >> deleteResponseHelpers [

]

{ #category : #types }
ApiClient >> dtoClass [ 

	^ self subclassResponsibility 
]

{ #category : #'helper methods' }
ApiClient >> ensureCollection: aProductOrCollection [

	^ aProductOrCollection isCollection
		  ifTrue: [ aProductOrCollection ]
		  ifFalse: [ Array with: aProductOrCollection ]
]

{ #category : #url }
ApiClient >> fullPath [

	^ self saasBasePath , self clientPathSegments
]

{ #category : #public }
ApiClient >> get [

	connectionHelper applyRequestHelpers.
	payload := connection executeRequest.
	connectionHelper applyResponseHelpers.
	^ payload
]

{ #category : #'helper methods' }
ApiClient >> getRequestHelpers [

	connectionHelper applyToRequest: {
			JSONHelper.
			GetHelper }
]

{ #category : #'helper methods' }
ApiClient >> getResponseHelpers [

	connectionHelper applyToResponse: { DtoFromResponseHelper }
]

{ #category : #initialization }
ApiClient >> initialize [

	token := Smalltalk os environment at: 'acapi_token'.
	connection := SAASConnection new.
	connectionHelper := ConnectionHelper for: self.
	connectionHelper applyToRequest: {
			UrlHelper.
			AuthenticationHelper }
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
ApiClient >> performCreateOrUpdate: anItemOrCollection [

	payload := (self ensureCollection: anItemOrCollection) collect: [
		          :item |
		          payload := item properties.
		          connectionHelper applyRequestHelpers.
		          connection executeRequest ].
	connectionHelper applyResponseHelpers.
	^ payload
]

{ #category : #'actions api' }
ApiClient >> read [


self getRequestHelpers.
	self getResponseHelpers.
	^ self get
]

{ #category : #url }
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
	^ self performCreateOrUpdate: anItemOrCollection 
]

{ #category : #'helper methods' }
ApiClient >> updateRequestHelpers [

	connectionHelper applyToRequest: {
			JSONHelper.
			PutHelper.
			BodyHelper }.
]

{ #category : #'helper methods' }
ApiClient >> updateResponseHelpers [

	connectionHelper applyToResponse: { DtoFromResponseHelper }
]
