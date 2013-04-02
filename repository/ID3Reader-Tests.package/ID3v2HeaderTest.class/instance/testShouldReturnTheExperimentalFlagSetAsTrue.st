flags
testShouldReturnTheExperimentalFlagSetAsTrue

	self assert: (self headerWithFlags: '00100000') experimentalFlag