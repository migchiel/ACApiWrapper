Class {
	#name : #AlertClient,
	#superclass : #ApiClient,
	#category : #'ACApiWrapper-Core'
}

{ #category : #url }
AlertClient >> clientPathSegments [

	^ '/api/alerts'
]

{ #category : #types }
AlertClient >> dtoClass [

	^ ACAlert 
]