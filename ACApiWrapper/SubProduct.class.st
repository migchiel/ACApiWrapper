Class {
	#name : #SubProduct,
	#superclass : #ApiCall,
	#category : #ACApiWrapper
}

{ #category : #'as yet unclassified' }
SubProduct >> apiPath [

	^ 'https://app.armorcode.com/api/sub-product'
]

{ #category : #'actions api' }
SubProduct >> get [

	super get.
	^ result
]

{ #category : #initialization }
SubProduct >> initialize [

	super initialize.
	requestHelpers
		add: (QueryHelper for: self);
		add: (BodyHelper for: self).
	responseHelpers add: (ResponseHelper for: self)
]
