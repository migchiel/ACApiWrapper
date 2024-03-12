Class {
	#name : #ACBusinessUnitScripts,
	#superclass : #ACScripts,
	#category : #'ACApiWrapper-Scripts-Script'
}

{ #category : #scripting }
ACBusinessUnitScripts >> getBusinessUnits [

	<script: 'self new getBusinessUnits'>
	ACApiItemView openWith: (tenant getBusinessUnits collect: #name)
]
