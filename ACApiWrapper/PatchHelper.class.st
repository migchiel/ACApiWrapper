Class {
	#name : #PatchHelper,
	#superclass : #ApiHelper,
	#category : #'ACApiWrapper-Helpers'
}

{ #category : #'target resize' }
PatchHelper >> apply [

	apiCall connection link method: #PATCH
]
