flags
testShouldReturnTheUnsynchronizationFlagSetAsFalse

	self deny: (self headerWithFlags: '00000000') unsynchronizationFlag