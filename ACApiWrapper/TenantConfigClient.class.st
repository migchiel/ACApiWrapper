Class {
	#name : #TenantConfigClient,
	#superclass : #ApiClient,
	#category : #'ACApiWrapper-Core'
}

{ #category : #url }
TenantConfigClient >> clientPathSegments [

	^ '/api/tenantConfig/allowedIPs'
]

{ #category : #types }
TenantConfigClient >> dtoClass [

	^ NeoJSONObject
]
