frames
testShouldReturnASingleFrameParsedCorrectly

	| parser frameBytes |
	frameBytes := #[84 73 84 50 0 0 0 7 0 0 0 72 111 111 100 111 111].
	parser := ID3Parser on: (self validHeader , frameBytes) readStream.

	self
		assert: parser frames size equals: 1;
		assert: parser frames first id equals: 'TIT2';
		assert: parser frames first content equals: 'Hoodoo'