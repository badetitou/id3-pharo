Class {
	#name : #BaselineOfID3,
	#superclass : #BaselineOf,
	#category : 'BaselineOfID3'
}

{ #category : #baselines }
BaselineOfID3 >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [ 
			self defineDependencies: spec.
			self definePackages: spec.
			self defineGroups: spec ]
]

{ #category : #baselines }
BaselineOfID3 >> defineDependencies: spec [
	
]

{ #category : #baselines }
BaselineOfID3 >> defineGroups: spec [
	spec
		group: 'core' with: #('ID3Reader-Core')
]

{ #category : #baselines }
BaselineOfID3 >> definePackages: spec [
	spec
		package: 'ID3Reader-Core';
		package: 'ID3Reader-Tests' with: [ spec requires: #('ID3Reader-Core') ]
]
