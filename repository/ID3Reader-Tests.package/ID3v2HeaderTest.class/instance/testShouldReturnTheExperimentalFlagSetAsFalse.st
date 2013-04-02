flags
testShouldReturnTheExperimentalFlagSetAsFalse

	self deny: (self headerWithFlags: '00000000') experimentalFlag