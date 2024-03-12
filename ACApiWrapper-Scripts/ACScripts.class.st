Class {
	#name : #ACScripts,
	#superclass : #Object,
	#instVars : [
		'tenant'
	],
	#category : #'ACApiWrapper-Scripts-Script'
}

{ #category : #helper }
ACScripts >> convertToTimeString: aUnixTimeMilliSeconds [

	aUnixTimeMilliSeconds
		ifNotNil: [ 
		^ (ZTimestamp fromUnixTime: aUnixTimeMilliSeconds / 1000) asString ]
		ifNil: [ ^ 'null' ]
]

{ #category : #initialization }
ACScripts >> initialize [

	tenant := ACTenant new.
	
]
