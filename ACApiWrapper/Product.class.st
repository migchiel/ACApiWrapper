Class {
	#name : #Product,
	#superclass : #ApiCall,
	#category : #ACApiWrapper
}

{ #category : #'as yet unclassified' }
Product >> apiPath [

	^ 'https://app.armorcode.com/user/product'
]

{ #category : #'actions api' }
Product >> get [

	super get.
	^ result
]

{ #category : #initialization }
Product >> initialize [

	super initialize.
	requestHelpers
		add: (JSONHelper for: self);
		add: (QueryHelper for: self);
		add: (BodyHelper for: self).
	responseHelpers add: (ResponseHelper for: self)
]
