Class {
	#name : #FeatureFlagClient,
	#superclass : #ApiClient,
	#category : #'ACApiWrapper-Core'
}

{ #category : #url }
FeatureFlagClient >> clientPathSegments [

	^ '/user/feature-flag'
]

{ #category : #types }
FeatureFlagClient >> dtoClass [

	^ ACFeatureFlag
]

{ #category : #'helper methods' }
FeatureFlagClient >> getResponseHelpers [ 

	
]
