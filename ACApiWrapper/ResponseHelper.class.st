Class {
	#name : #ResponseHelper,
	#superclass : #ApiHelper,
	#category : #'ACApiWrapper-Helpers'
}

{ #category : #'target resize' }
ResponseHelper >> apply [

	super apply.
	self trace: '-- RESPONSE --', self className
]
