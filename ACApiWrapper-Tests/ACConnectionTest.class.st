"
An ACConnectionTest is a test class for testing the behavior of ACConnection
"
Class {
	#name : #ACConnectionTest,
	#superclass : #TestCase,
	#category : #'ACApiWrapper-Tests-Core'
}

{ #category : #test }
ACConnectionTest >> testSetUrl [

	| connection |
	
	connection := ACConnection for: ACTenant new.
	connection setUrl: 'some/goofy/path'.
	self assert: connection request url equals: 'bla'
]
