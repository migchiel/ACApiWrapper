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
	"		package: 'ACApiWrapper-Tests'
			with: [ spec requires: #( 'ACApiCore' ) ];"
			group: 'Core' with: #( 'ACApiWrapper')
			"group: 'Tests' with: #( 'ACApiCore-Tests' ) "]
]

{ #category : #initialization }
BaselineOfACApiWrapper >> setUpDependencies: spec [

	spec
		baseline: 'NeoJSON'
		with: [ spec repository: 'github://svenvc/NeoJSON/repository' ];
		baseline: 'ZTimestamp'
		with: [ spec repository: 'github://svenvc/ztimestamp' ];
		baseline: 'NeoCSV'
		with: [ spec repository: 'github://svenvc/NeoCSV/repository' ];
		baseline: 'PetitParser2Core'
		with: [ spec repository: 'github://kursjan/petitparser2' ]
]
