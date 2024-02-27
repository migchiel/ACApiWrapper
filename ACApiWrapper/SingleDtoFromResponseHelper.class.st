Class {
	#name : #SingleDtoFromResponseHelper,
	#superclass : #Object,
	#category : #'ACApiWrapper-Helpers'
}

{ #category : #operations }
SingleDtoFromResponseHelper class >> applyTo: anApiCall [

anApiCall result: (anApiCall dtoClass new
			 properties: anApiCall result;
			 yourself)
]
