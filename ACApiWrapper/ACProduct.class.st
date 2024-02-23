Class {
	#name : #ACProduct,
	#superclass : #ACObject,
	#category : #'ACApiWrapper-Dto'
}

{ #category : #accessing }
ACProduct >> type [ 

	^ properties type
]

{ #category : #accessing }
ACProduct >> type: aType [

	^ properties type: aType
]
