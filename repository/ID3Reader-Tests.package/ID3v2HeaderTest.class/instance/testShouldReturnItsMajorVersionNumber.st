version info
testShouldReturnItsMajorVersionNumber

	| header |
	header := ID3v2Header withBytes: 'ID3' asByteArray , #[4 0 0 0 0 0 0].
	
	self assert: header majorVersion = 4