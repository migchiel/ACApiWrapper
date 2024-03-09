Class {
	#name : #ACUserScripts,
	#superclass : #ACScripts,
	#category : #'ACApiWrapper-Scripts'
}

{ #category : #'as yet unclassified' }
ACUserScripts >> getUsers [

	<script: 'self new getUsers'>
	ACApiItemView openWith: (tenant getUsers collect: #name)
]
