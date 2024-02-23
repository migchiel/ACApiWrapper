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

{ #category : #accessing }
ACObject >> createdBy [

	^ properties createdBy
]

{ #category : #accessing }
ACObject >> deleted [

	^ properties deleted
]

{ #category : #accessing }
ACObject >> deleted: aBoolean [

	^ properties deleted: aBoolean
]

{ #category : #accessing }
ACObject >> description [

	^ properties description
]

{ #category : #accessing }
ACObject >> description: aDescription [

	^ properties description: aDescription 
]

{ #category : #accessing }
ACObject >> id [

	^ properties id
]

{ #category : #accessing }
ACObject >> id: anId [

	^ properties id: anId
]

{ #category : #accessing }
ACObject >> name [ 

	^ properties name
]

{ #category : #accessing }
ACObject >> name: aName [

	^ properties name: aName
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
