Class {
	#name : #ACConnection,
	#superclass : #Object,
	#instVars : [
		'tenant',
		'connection',
		'request',
		'showProgress'
	],
	#category : #'ACApiWrapper-Core'
}

{ #category : #'instance creation' }
ACConnection class >> for: aTenant [

	^ self new tenant: aTenant
]

{ #category : #initialization }
ACConnection >> apiLimitDelay [

	"retry wait time for HTTP 429, api rate limit (in seconds)"
	^ 64
]

{ #category : #initialization }
ACConnection >> authenticateUsing: anApiKey [

	connection setBearerAuthentication:
		anApiKey 
]

{ #category : #initialization }
ACConnection >> basePath [

	^ tenant url asZnUrl
]

{ #category : #operations }
ACConnection >> delete: aUrl [

	self setUrl: aUrl. connection method: #DELETE.
	^ self executeRequest
]

{ #category : #accessing }
ACConnection >> executeRequest [

	self setGeneralRequestOptions.
	UIManager default informUserDuring: [ :bar |
		bar label: 'Performing API call...'.
		[
		^ connection
			  ifFail: [ :exception |
				  ((exception isKindOf: ZnHttpUnsuccessful) and: [
						   #( 429 ) includes: exception response code ]) ifTrue: [
						  self recoverFromApiLimit.
						  exception signaler execute ] ];
			  execute ]
			on: HTTPProgress
			do: [ :progress |
				bar label: progress printString.
				progress isEmpty ifFalse: [ bar current: progress percentage ].
				progress resume ] ]
]

{ #category : #operations }
ACConnection >> get: aUrl [

	self setUrl: aUrl.
	connection
		forJsonREST;
		method: #GET.
	^ self executeRequest
]

{ #category : #operations }
ACConnection >> get: aUrl withQuery: aDictionary [

	self setUrl: aUrl.
	connection
		queryAddAll: aDictionary asDictionary;
		forJsonREST;
		method: #GET.
	^ self executeRequest
]

{ #category : #initialization }
ACConnection >> initialize [

	showProgress := false.
	connection := ZnClient new
		              systemPolicy;
		              logLevel: 3;
		              signalProgress: false;
		              autoResetEntityMethods: #( HEAD DELETE GET );
		              logToTranscript;
		              yourself
]

{ #category : #operations }
ACConnection >> performForUrl: aUrl withPayload: aPayload [

	self setUrl: aUrl.
	connection
		contents: aPayload;
		forJsonREST.
	^ self executeRequest
]

{ #category : #operations }
ACConnection >> post: aUrl withPayload: aPayload [

	connection method: #POST.
	^ self performForUrl: aUrl withPayload: aPayload
	
]

{ #category : #operations }
ACConnection >> put: aUrl withPayload: aPayload [

	connection method: #PUT.
	^ self performForUrl: aUrl withPayload: aPayload 
]

{ #category : #initialization }
ACConnection >> recoverFromApiLimit [

	1 to: self apiLimitDelay do: [ :each |
		HTTPProgress
			signal:
				'API Rate limit hit,delaying for ' , self apiLimitDelay asString
				, ' seconds...'
			amount: each
			total: self apiLimitDelay.
		(Delay forSeconds: 1) wait ]
]

{ #category : #initialization }
ACConnection >> setGeneralRequestOptions [

	self authenticateUsing: tenant apiKey.
	connection setAcceptEncodingGzip.
]

{ #category : #initialization }
ACConnection >> setUrl: aUrl [

connection
		url: self basePath + aUrl
]

{ #category : #initialization }
ACConnection >> setupConnection [

	connection := ZnClient new
		              systemPolicy;
		              logLevel: 3;
		              numberOfRetries: 3;
		              retryDelay: 2;
		              signalProgress: false;
		              autoResetEntityMethods: #( HEAD DELETE GET );
		              logToTranscript
]

{ #category : #accessing }
ACConnection >> tenant: aTenant [

	tenant := aTenant 
]

{ #category : #accessing }
ACConnection >> url: aUrl [

	connection url: aUrl
]
