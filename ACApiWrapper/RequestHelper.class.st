Class {
	#name : #RequestHelper,
	#superclass : #ApiHelper,
	#category : #'ACApiWrapper-Helpers'
}

{ #category : #'target resize' }
RequestHelper >> apply [

	super apply.
	self trace: '-- REQUEST --', self className
]
