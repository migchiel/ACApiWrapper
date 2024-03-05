Class {
	#name : #AlertClient,
	#superclass : #ApiClient,
	#category : #'ACApiWrapper-Core'
}

{ #category : #url }
AlertClient >> clientPathSegments [

	^ '/api/alerts'
]

{ #category : #'helper methods' }
AlertClient >> createResponseHelpers [

	connectionHelper applyToResponse: { MultipleDtoFromResponseHelper }
]

{ #category : #types }
AlertClient >> dtoClass [

	^ ACAlert 
]

{ #category : #'helper methods' }
AlertClient >> getResponseHelpers [

	connectionHelper applyToResponse: { PaginatedResponseHelper }
]
