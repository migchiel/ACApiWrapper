Class {
	#name : #ACUserScripts,
	#superclass : #ACScripts,
	#category : #'ACApiWrapper-Scripts'
}

{ #category : #'as yet unclassified' }
ACUserScripts >> getUsers [

	<script: 'self new getUsers'>
	ACApiItemView openWith: (UserClient new read collect: #name)
]
