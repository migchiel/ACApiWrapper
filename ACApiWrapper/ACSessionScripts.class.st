Class {
	#name : #ACSessionScripts,
	#superclass : #ACScripts,
	#category : #'ACApiWrapper-Scripts'
}

{ #category : #scripting }
ACSessionScripts >> getSessionDetails [

	<script: 'self new getSessionDetails'>
	| sessionDetails |
	sessionDetails := tenant getSessionDetails.
	ACApiItemView openWith: { 
			('Organisation   : ' , sessionDetails currentOrgSessionDto name).
			('Organisation ID: '
			 , sessionDetails currentOrgSessionDto id asString) }
]
