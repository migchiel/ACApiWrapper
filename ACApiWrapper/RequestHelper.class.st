Class {
	#name : #RequestHelper,
	#superclass : #ApiHelper,
	#category : #'ACApiWrapper-Helpers'
}

{ #category : #testing }
RequestHelper class >> isAbstract [

	^ self == RequestHelper 
]

{ #category : #'target resize' }
RequestHelper >> apply [

	super apply.
	self trace: 'REQUEST --> ' , self className
]
