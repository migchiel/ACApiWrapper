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

	| connection path |
	connection := ACConnection for: ACTenant new.
	path := '/some/goofy/path'.
	connection setUrl: path.
	self
		assert: connection httpClient request url
		equals: ACTenant defaultTenant asZnUrl / path
]
