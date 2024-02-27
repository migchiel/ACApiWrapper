Class {
	#name : #DtoFromResponseHelper,
	#superclass : #Object,
	#category : #'ACApiWrapper-Helpers'
}

{ #category : #operations }
DtoFromResponseHelper class >> applyTo: anApiCall [

	anApiCall payload: (anApiCall payload collect: [ :item |
			 anApiCall dtoClass new
				 properties: item;
				 yourself ])
]
