Class {
	#name : #MultipleDtoFromResponseHelper,
	#superclass : #Object,
	#category : #'ACApiWrapper-Helpers'
}

{ #category : #operations }
MultipleDtoFromResponseHelper class >> applyTo: anApiCall [

	anApiCall payload: (anApiCall payload collect: [ :item |
			 anApiCall dtoClass new
				 properties: item;
				 yourself ])
]
