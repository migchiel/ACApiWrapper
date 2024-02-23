Class {
	#name : #ProductClient,
	#superclass : #ApiClient,
	#category : #ACApiWrapper
}

{ #category : #'as yet unclassified' }
ProductClient >> apiPath [

	^ super apiPath, '/user/product'
]

{ #category : #public }
ProductClient >> delete: aProductCollection [

	items := aProductCollection.
	requestHelpers
		add: (AddSegmentHelper for: self).
	^ self delete
]

{ #category : #public }
ProductClient >> post: aProductCollection [

	items := aProductCollection.
	requestHelpers add: (BodyHelper for: self).
	^ self post
]

{ #category : #public }
ProductClient >> put: aProductCollection [

	items := aProductCollection.
	requestHelpers add: (BodyHelper for: self).
	^ self put
]
