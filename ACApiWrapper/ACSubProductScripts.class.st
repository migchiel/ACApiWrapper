Class {
	#name : #ACSubProductScripts,
	#superclass : #ACScripts,
	#category : #'ACApiWrapper-Scripts'
}

{ #category : #'as yet unclassified' }
ACSubProductScripts >> getSubProductTypes [

	<script: 'self new getSubProductTypes'>
	ACApiItemView openWith: (SubProductTypeClient new read collect: #name)
]

{ #category : #'as yet unclassified' }
ACSubProductScripts >> getSubProducts [

	<script: 'self new getSubProducts'>
	ACApiItemView openWith: (SubProductClient new read collect: #name)
]
