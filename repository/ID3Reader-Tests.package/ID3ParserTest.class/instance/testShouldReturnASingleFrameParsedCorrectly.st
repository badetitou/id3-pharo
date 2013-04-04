frames
testShouldReturnASingleFrameParsedCorrectly

	| parser frameBytes |
	frameBytes := #[84 73 84 50 0 0 0 7 0 0 0 72 111 111 100 111 111].
	parser := ID3Parser on: (self validHeader , frameBytes) readStream.

	self assert: parser frames size == 1.
	self assert: parser frames first id = 'TIT2'.
	self assert: parser frames first content = 'Hoodoo'