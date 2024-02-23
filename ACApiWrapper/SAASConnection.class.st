Class {
	#name : #SAASConnection,
	#superclass : #Object,
	#instVars : [
		'apiClient',
		'link'
	],
	#category : #'ACApiWrapper-Core'
}

{ #category : #'instance creation' }
SAASConnection class >> for: anApiClient [

	^ self basicNew initialize
]

{ #category : #'as yet unclassified' }
SAASConnection >> apiLimitDelay [

	"retry wait time for HTTP 429, api rate limit (in seconds)"
	^ 64
]

{ #category : #'as yet unclassified' }
SAASConnection >> executeRequest [

UIManager default informUserDuring: [ :bar |
		bar label: 'Performing API call...'.
		[
		^ link
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
SAASConnection >> initialize [ 

	self setupConnection

	
]

{ #category : #accessing }
SAASConnection >> link [

	^ link
]

{ #category : #'as yet unclassified' }
SAASConnection >> recoverFromApiLimit [

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
SAASConnection >> setupConnection [

	link := ZnClient new
		              systemPolicy;
		              logLevel: 3;
		              signalProgress: false;
		              autoResetEntityMethods: #( HEAD DELETE GET );
		              logToTranscript;
		              yourself
]
