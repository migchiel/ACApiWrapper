Class {
	#name : #SingleDtoFromResponseHelper,
	#superclass : #Object,
	#category : #'ACApiWrapper-Helpers'
}

{ #category : #operations }
SingleDtoFromResponseHelper class >> applyTo: anApiCall [

	anApiCall payload: (anApiCall dtoClass new
			 properties: anApiCall payload;
			 yourself)
]
