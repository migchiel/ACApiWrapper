Class {
	#name : #PostHelper,
	#superclass : #ApiHelper,
	#category : #'ACApiWrapper-Helpers'
}

{ #category : #'target resize' }
PostHelper >> apply [

	apiCall connection link method: #POST
]
