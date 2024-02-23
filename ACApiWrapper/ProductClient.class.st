Class {
	#name : #ProductClient,
	#superclass : #ApiClient,
	#category : #'ACApiWrapper-Core'
}

{ #category : #'as yet unclassified' }
ProductClient class >> dtoClass [

	^ ACProduct
]

{ #category : #'as yet unclassified' }
ProductClient >> apiPath [

	^ super apiPath, '/user/product'
]

{ #category : #public }
ProductClient >> create: aProductCollection [

	^ aProductCollection collect: [ :item |
		  payload := item.
		  requestHelpers add: (BodyHelper for: self).
		  self post ]
]

{ #category : #public }
ProductClient >> delete: aProductCollection [

	^ aProductCollection collect: [ :item |
		  payload := item.
		  requestHelpers add: (AddSegmentHelper for: self).
		  self delete ]
]

{ #category : #public }
ProductClient >> update: aProductCollection [

	payload := aProductCollection.
	requestHelpers add: (BodyHelper for: self).
	^ self put
]
