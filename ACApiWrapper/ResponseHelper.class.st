Class {
	#name : #ResponseHelper,
	#superclass : #ApiHelper,
	#category : #'ACApiWrapper-Helpers'
}

{ #category : #testing }
ResponseHelper class >> isAbstract [

	^ self == ResponseHelper 
]

{ #category : #'target resize' }
ResponseHelper >> apply [

	super apply.
	self trace: '--> RESPONSE --> ' , self className
]
