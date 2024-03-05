Class {
	#name : #PostHelper,
	#superclass : #Object,
	#category : #'ACApiWrapper-Helpers'
}

{ #category : #operations }
PostHelper class >> applyTo: anApiCall [

	anApiCall connection connection method: #POST
]
