Class {
	#name : #FindingClient,
	#superclass : #ApiClient,
	#category : #'ACApiWrapper-Core'
}

{ #category : #url }
FindingClient >> clientPathSegments [

	^ '/user/findings/'
]

{ #category : #'helper methods' }
FindingClient >> createResponseHelpers [

	connectionHelper applyToResponse: { PaginatedResponseHelper  }
]

{ #category : #types }
FindingClient >> dtoClass [

	^ ACFinding
]

{ #category : #'actions api' }
FindingClient >> read [

	| body |
	body := ACFinding new properties: (NeoJSONObject fromString:
			         '{"page":0,"size":100,"sort":"","sortColumns":[],"filters":{},"ticketStatusRequired":true,"ignoreMitigated":null,"ignoreDuplicate":true}').
	connectionHelper resetHelpers.
	self createRequestHelpers.
	self createResponseHelpers.
	self performCreateOrUpdate: body
]
