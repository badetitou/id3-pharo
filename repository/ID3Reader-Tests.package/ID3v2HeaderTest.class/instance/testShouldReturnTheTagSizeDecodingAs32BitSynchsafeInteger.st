tag length
testShouldReturnTheTagSizeDecodingAs32BitSynchsafeInteger

	| header tagSizeBytes |
	tagSizeBytes := #[0 0 8 44].
	header := ID3v2Header withBytes: 'ID3' asByteArray , #[4 0] , #[0] , tagSizeBytes.
	
	self assert: header tagSize = 1068