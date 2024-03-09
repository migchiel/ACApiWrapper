Class {
	#name : #ACAuditScripts,
	#superclass : #ACScripts,
	#category : #'ACApiWrapper-Scripts'
}

{ #category : #'as yet unclassified' }
ACAuditScripts >> getAlerts [

	<script: 'self new getAlerts'>
	| alerts |
	alerts := tenant getAlerts content collect: [ :entry | 
		          String streamContents: [ :s | 
			          s << entry title << ' at ' << (self convertToTimeString:
				          entry createdAt) ] ].
	ACApiItemView openWith: alerts
]

{ #category : #'as yet unclassified' }
ACAuditScripts >> getLogins [

	<script: 'self new getLogins'>
	| logins |
	logins := tenant getLogins content collect: [ :entry | 
		          String streamContents: [ :s | 
			          s << entry message << ' at '
			          << (self convertToTimeString: entry createdAt)
			          << ' from ' << entry clientIp ] ].
	ACApiItemView openWith: logins
]
