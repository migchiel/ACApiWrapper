Class {
	#name : #BaselineOfACApiWrapper,
	#superclass : #BaselineOf,
	#category : #BaselineOfACApiWrapper
}

{ #category : #baselines }
BaselineOfACApiWrapper >> baseline: spec [

	<baseline>
	spec for: #common do: [ 
		self setUpDependencies: spec.
		spec
			package: 'ACApiWrapper'
			with: [ spec requires: #( 'NeoJSON' 'ZTimestamp' ) ];
			package: 'ACApiWrapper-Scripts'
			with: [ spec requires: #( 'ACApiWrapper' ) ];
			package: 'ACApiWrapper-Tests'
			with: [ spec requires: #( 'ACApiWrapper' ) ];
			group: 'Core' with: #( 'ACApiWrapper' );
			group: 'Scripts' with: #( 'ACApiWrapper-Scripts' );
			group: 'Tests' with: #( 'ACApiWrapper-Tests' ) ]
]

{ #category : #initialization }
BaselineOfACApiWrapper >> setUpDependencies: spec [

	spec
		baseline: 'NeoJSON' with: [ 
			spec
				loads: #( 'core' );
				repository: 'github://svenvc/NeoJSON/repository' ];
		baseline: 'ZTimestamp'
		with: [ spec loads: #( 'core' );repository: 'github://svenvc/ztimestamp' ];
		baseline: 'NeoCSV'
		with: [ spec loads: #( 'core' );repository: 'github://svenvc/NeoCSV/repository' ]
]
