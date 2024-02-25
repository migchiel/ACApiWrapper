Class {
	#name : #ConnectionHelper,
	#superclass : #Object,
	#instVars : [
		'requestHelpers',
		'responseHelpers'
	],
	#category : #'ACApiWrapper-Helpers'
}

{ #category : #initialization }
ConnectionHelper >> initialize [ 

responseHelpers := OrderedCollection new.
	requestHelpers := OrderedCollection new.


]
