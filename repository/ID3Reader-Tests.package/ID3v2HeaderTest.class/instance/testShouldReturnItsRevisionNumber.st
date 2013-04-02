version info
testShouldReturnItsRevisionNumber

	| header |
	header := ID3v2Header withBytes: 'ID3' asByteArray , #[4 0 0 0 0 0 0].
	
	self assert: header revision = 0