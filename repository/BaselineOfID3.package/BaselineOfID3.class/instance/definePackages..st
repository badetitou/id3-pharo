baselines
definePackages: spec
	spec
		package: 'ID3Reader-Core';
		package: 'ID3Reader-Tests' with: [ spec requires: #('ID3Reader-Core') ]