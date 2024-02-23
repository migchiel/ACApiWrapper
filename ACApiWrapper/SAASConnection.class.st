Class {
	#name : #SAASConnection,
	#superclass : #Object,
	#instVars : [
		'apiClient',
		'link'
	],
	#category : #ACApiWrapper
}

{ #category : #'instance creation' }
SAASConnection class >> for: anApiClient [

	^ self basicNew initialize
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
SAASConnection >> setupConnection [

	link := ZnClient new
		              systemPolicy;
		              logLevel: 3;
		              signalProgress: false;
		              autoResetEntityMethods: #( HEAD DELETE GET );
		              logToTranscript;
		              yourself
]
