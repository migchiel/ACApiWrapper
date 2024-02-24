Class {
	#name : #ACObject,
	#superclass : #Object,
	#instVars : [
		'properties'
	],
	#category : #'ACApiWrapper-Dto'
}

{ #category : #'as yet unclassified' }
ACObject >> convertToTimeString: aUnixTimeMilliSeconds [

	aUnixTimeMilliSeconds
		ifNotNil: [
			^ (ZTimestamp fromUnixTime: aUnixTimeMilliSeconds / 1000) ]
		ifNil: [ ^ 'null' ]
]

{ #category : #accessing }
ACObject >> createdAt [

	^ self convertToTimeString: properties createdAt
]

{ #category : #'reflective operations' }
ACObject >> doesNotUnderstand: message [
	"Overwritten so that 'self foo' becomes 'self at: #foo'
	and 'self foo: 1' becomes 'self at: #foo put: 1' except that self is returned"

	| key |
	key := message selector.
	key isUnary ifTrue: [ ^ self properties at: key ].
	^ (key isKeyword and: [ key numArgs = 1 ])
		  ifTrue: [
			  self properties
				  at: key allButLast asSymbol put: message arguments first;
				  yourself ]
		  ifFalse: [ super doesNotUnderstand: message ]
]

{ #category : #initialization }
ACObject >> initialize [ 

	properties := NeoJSONObject new.
]

{ #category : #accessing }
ACObject >> properties [

	^ properties
]

{ #category : #accessing }
ACObject >> properties: anObject [

	properties := anObject
]

{ #category : #accessing }
ACObject >> updatedAt [

	^ self convertToTimeString: properties updatedAt
]
