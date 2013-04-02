flags
testShouldReturnTheExtendedHeaderFlagSetAsFalse

	self deny: (self headerWithFlags: '00000000') extendedHeaderFlag