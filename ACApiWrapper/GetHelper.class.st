Class {
	#name : #GetHelper,
	#superclass : #ApiHelper,
	#category : #'ACApiWrapper-Helpers'
}

{ #category : #'target resize' }
GetHelper >> apply [

	apiCall connection link method: #GET
]
