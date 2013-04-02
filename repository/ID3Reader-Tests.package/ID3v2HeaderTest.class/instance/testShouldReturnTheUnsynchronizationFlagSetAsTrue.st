flags
testShouldReturnTheUnsynchronizationFlagSetAsTrue

	self assert: (self headerWithFlags: '10000000') unsynchronizationFlag