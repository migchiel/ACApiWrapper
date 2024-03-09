Class {
	#name : #ACSubProductScripts,
	#superclass : #ACScripts,
	#category : #'ACApiWrapper-Scripts'
}

{ #category : #'as yet unclassified' }
ACSubProductScripts >> getSubProductTypes [

	<script: 'self new getSubProductTypes'>
	ACApiItemView openWith:
		(tenant getSubProductTypes collect: #name)
]

{ #category : #'as yet unclassified' }
ACSubProductScripts >> getSubProducts [

	<script: 'self new getSubProducts'>
	ACApiItemView openWith: (tenant getSubProducts content collect: #name)
]
