Class {
	#name : #ACObject,
	#superclass : #Object,
	#instVars : [
		'properties'
	],
	#category : #'ACApiWrapper-Dto'
}

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
