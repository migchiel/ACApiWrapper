Class {
	#name : #ACSubProductScripts,
	#superclass : #ACScripts,
	#category : #'ACApiWrapper-Scripts-Script'
}

{ #category : #scripting }
ACSubProductScripts >> getSubProductTypes [

	<script: 'self new getSubProductTypes'>
	ACApiItemView openWith:
		(tenant getSubProductTypes collect: #name)
]

{ #category : #scripting }
ACSubProductScripts >> getSubProducts [

	<script: 'self new getSubProducts'>
	ACApiItemView openWith: (tenant getSubProducts collect: #name)
]
