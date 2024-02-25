Class {
	#name : #DtoFromResponseHelper,
	#superclass : #ApiHelper,
	#category : #'ACApiWrapper-Helpers'
}

{ #category : #'target resize' }
DtoFromResponseHelper >> apply [

	apiCall result: (apiCall result collect: [ :item |
			 apiCall dtoClass new
				 properties: item;
				 yourself ])
]
