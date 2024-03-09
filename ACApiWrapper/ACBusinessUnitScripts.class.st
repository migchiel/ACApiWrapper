Class {
	#name : #ACBusinessUnitScripts,
	#superclass : #ACScripts,
	#category : #'ACApiWrapper-Scripts'
}

{ #category : #'as yet unclassified' }
ACBusinessUnitScripts >> getBusinessUnits [

	<script: 'self new getBusinessUnits'>
	ACApiItemView openWith: (tenant getBusinessUnits collect: #name)
]
