Class {
	#name : #ACAuditScripts,
	#superclass : #ACScripts,
	#category : #'ACApiWrapper-Scripts'
}

{ #category : #'as yet unclassified' }
ACAuditScripts >> getAlerts [

	<script: 'self new getAlerts'>
	| alerts |
	alerts := AlertClient new read content collect: [ :entry |
		          String streamContents: [ :s |
			          s << entry title << ' at ' << entry createdAt] ].
	ACApiItemView openWith: alerts 
]

{ #category : #'as yet unclassified' }
ACAuditScripts >> getLogins [

	<script: 'self new getLogins'>
	| logins |
	logins := AuditLogClient new read content collect: [ :entry |
		 String streamContents: [ :s |
			 s << entry message << ' at ' << entry createdAt << ' from '
			 << entry clientIp ] ].
	ACApiItemView openWith: logins.
]
