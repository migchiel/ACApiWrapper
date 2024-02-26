Class {
	#name : #AuditLogClient,
	#superclass : #ApiClient,
	#category : #'ACApiWrapper-Core'
}

{ #category : #url }
AuditLogClient >> clientPathSegments [

	^ '/user/audit/log/details/page?page=0&size=1000'
]

{ #category : #types }
AuditLogClient >> dtoClass [

	^ ACAuditLog 
]

{ #category : #'helper methods' }
AuditLogClient >> getResponseHelpers [

	connectionHelper applyToResponse: { PaginatedResponseHelper . DtoFromResponseHelper  }
]
