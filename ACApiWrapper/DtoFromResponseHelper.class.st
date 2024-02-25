Class {
	#name : #DtoFromResponseHelper,
	#superclass : #ResponseHelper,
	#category : #'ACApiWrapper-Helpers'
}

{ #category : #'target resize' }
DtoFromResponseHelper >> apply [

	super apply.
	apiCall result: (apiCall result collect: [ :item |
			 apiCall dtoClass new properties: item;yourself ])
]
