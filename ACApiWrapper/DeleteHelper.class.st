Class {
	#name : #DeleteHelper,
	#superclass : #ApiHelper,
	#category : #'ACApiWrapper-Helpers'
}

{ #category : #'target resize' }
DeleteHelper >> apply [

	apiCall connection link method: #DELETE
]
