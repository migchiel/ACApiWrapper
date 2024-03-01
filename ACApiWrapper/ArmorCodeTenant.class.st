Class {
	#name : #ArmorCodeTenant,
	#superclass : #Object,
	#instVars : [
		'url',
		'apiKey'
	],
	#category : #'ACApiWrapper-Core'
}

{ #category : #'as yet unclassified' }
ArmorCodeTenant class >> connectTo: aUrl usingApiKey: anApiKey [

	| aWorkbench |
	aWorkbench := self basicNew.
	aWorkbench
		url: aUrl;
		apiKey: anApiKey;initialize.
	^ aWorkbench
]

{ #category : #'as yet unclassified' }
ArmorCodeTenant class >> connectUsingApiKey: anApiKey [

	^ self connectTo: self defaultTenant usingApiKey: anApiKey
]

{ #category : #'as yet unclassified' }
ArmorCodeTenant class >> defaultTenant [

	^ 'https://app.armorcode.com'
]

{ #category : #'instance creation' }
ArmorCodeTenant class >> new [

	self error:
		'An ArmorCodeTenant connection is created using ''connectUsingApiKey:'' or ''connectTo: usingApiKey:'''
]

{ #category : #accessing }
ArmorCodeTenant >> apiKey [
	^ apiKey
]

{ #category : #accessing }
ArmorCodeTenant >> apiKey: anApiKey [

	apiKey := anApiKey 
]

{ #category : #accessing }
ArmorCodeTenant >> url [
	^ url
]

{ #category : #accessing }
ArmorCodeTenant >> url: aUrl [

	url := aUrl
]
