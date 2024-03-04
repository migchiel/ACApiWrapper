Class {
	#name : #ACApiItemView,
	#superclass : #SpListPresenter,
	#instVars : [
		'table',
		'items'
	],
	#category : #'ACApiWrapper-Scripts'
}

{ #category : #'api - showing' }
ACApiItemView class >> openWith: aCollection [

	^ (self basicNew items: aCollection)
		  initialize;
		  open
]

{ #category : #'api - showing' }
ACApiItemView class >> openWith: aCollection title: aTitle [

	^ (self basicNew items: aCollection)
		  initialize;
		  open
]

{ #category : #layout }
ACApiItemView >> defaultLayout [

	^ SpBoxLayout newTopToBottom
		  add: table;
		  yourself
]

{ #category : #initialization }
ACApiItemView >> initialize [

	super initialize
]

{ #category : #initialization }
ACApiItemView >> initializePresenters [

	table := self newTable.

	table
		addColumn: (SpStringTableColumn evaluated: #value);
		items: items;
		beResizable
]

{ #category : #api }
ACApiItemView >> items: anItemCollection [

	items := anItemCollection
]
