flags
testShouldReturnTheExtendedHeaderFlagSetAsTrue

	self assert: (self headerWithFlags: '01000000') extendedHeaderFlag