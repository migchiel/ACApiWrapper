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
ProductClient >> create: aProductOrCollection [

	requestHelpers add: (BodyHelper for: self).
	^ (self ensureCollection: aProductOrCollection) collect: [ :item |
		  payload := item properties.
		  self post ]
]

{ #category : #public }
ProductClient >> delete: aProductOrCollection [

	requestHelpers add: (AddSegmentHelper for: self).
	^ (self ensureCollection: aProductOrCollection) collect: [ :item |
		  payload := item.
		  self delete ]
]

{ #category : #'as yet unclassified' }
ProductClient >> ensureCollection: aProductOrCollection [

	^ aProductOrCollection isCollection
		ifTrue: [ aProductOrCollection ]
		ifFalse: [ Array with: aProductOrCollection ].

]

{ #category : #public }
ProductClient >> update: aProductCollection [

	payload := aProductCollection.
	requestHelpers add: (BodyHelper for: self).
	^ self put
]
