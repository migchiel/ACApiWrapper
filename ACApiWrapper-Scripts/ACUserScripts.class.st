Class {
	#name : #ACUserScripts,
	#superclass : #ACScripts,
	#category : #'ACApiWrapper-Scripts-Script'
}

{ #category : #scripting }
ACUserScripts >> getUsers [

	<script: 'self new getUsers'>
	ACApiItemView openWith: (tenant getUsers collect: #name)
]
