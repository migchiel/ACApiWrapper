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

{ #category : #'actions api' }
ApiClient >> delete [

	connectionHelper  applyRequestHelpers.
	result := connection executeRequest.
	^ result
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

	connectionHelper
		applyToRequest: {
				JSONHelper.
				GetHelper };
		applyToResponse: { DtoFromResponseHelper };
		applyRequestHelpers.
	result := connection executeRequest.
	connectionHelper  applyResponseHelpers.
	^ result
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
