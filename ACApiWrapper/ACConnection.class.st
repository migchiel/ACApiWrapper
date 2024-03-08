Class {
	#name : #ACConnection,
	#superclass : #Object,
	#instVars : [
		'apiClient',
		'connection'
	],
	#category : #'ACApiWrapper-Core'
}

{ #category : #'as yet unclassified' }
ACConnection >> apiLimitDelay [

	"retry wait time for HTTP 429, api rate limit (in seconds)"
	^ 64
]

{ #category : #'as yet unclassified' }
ACConnection >> authenticateUsing: anApiKey [

	connection setBearerAuthentication:
		anApiKey 
]

{ #category : #accessing }
ACConnection >> body: aPayload [

	connection contents: aPayload
]

{ #category : #accessing }
ACConnection >> connection [

	^ connection
]

{ #category : #'as yet unclassified' }
ACConnection >> executeRequest [

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

{ #category : #initialization }
ACConnection >> initialize [

	connection := ZnClient new
		              systemPolicy;
											forJsonREST;
		              logLevel: 3;
		              signalProgress: false;
		              autoResetEntityMethods: #( HEAD DELETE GET );
		              logToTranscript;
		              yourself
]

{ #category : #accessing }
ACConnection >> method: aHttpMethod [

	connection method: aHttpMethod 
]

{ #category : #'as yet unclassified' }
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

{ #category : #'as yet unclassified' }
ACConnection >> setupConnection [

	connection := ZnClient new
		        systemPolicy;
		        logLevel: 3;
		        signalProgress: false;
		        autoResetEntityMethods: #( HEAD DELETE GET );
		        logToTranscript;
		        yourself
]

{ #category : #accessing }
ACConnection >> url: aUrl [

	connection url: aUrl
]
