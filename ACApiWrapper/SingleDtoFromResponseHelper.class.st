Class {
	#name : #SingleDtoFromResponseHelper,
	#superclass : #ApiHelper,
	#category : #'ACApiWrapper-Helpers'
}

{ #category : #'target resize' }
SingleDtoFromResponseHelper >> apply [

	apiCall result: (
			 apiCall dtoClass new
				 properties: apiCall result;
				 yourself )
]
