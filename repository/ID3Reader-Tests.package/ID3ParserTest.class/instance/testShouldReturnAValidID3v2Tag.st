id3v2
testShouldReturnAValidID3v2Tag

	| bytes parser tag |
	bytes := 'ID3' asByteArray , #[4 0 0 0 0 111 118]
		, 'TALB' asByteArray , #[0 0 0 9 0 0 3] , 'Kamikaze' asByteArray
		, 'TPE1' asByteArray , #[0 0 0 22 0 0 3] , 'Luis Alberto Spinetta' asByteArray
		, 'TIT2' asByteArray , #[0 0 0 14 0 0 3] , 'Barro Tal Vez' asByteArray.
	parser := ID3Parser on: bytes readStream.
	tag := parser id3v2Tag.
	
	self
		assert: tag title equals: 'Barro Tal Vez';
		assert: tag artist equals: 'Luis Alberto Spinetta';
		assert: tag album equals: 'Kamikaze'